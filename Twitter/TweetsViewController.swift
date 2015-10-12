//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Kevin Chen on 9/30/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TweetComposeViewControllerDelegate {
    
    var tweets: [Tweet]?
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        setupRefresh()
        refreshLoad()
    }
    
    private func setupRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refreshLoad", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func refreshLoad() {
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
        self.tableView.reloadData()
        print("TWEETSSS: \(self.tweets)")
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetTableViewCell", forIndexPath: indexPath) as! TweetTableViewCell
        cell.tweet = self.tweets?[indexPath.row]
        
        cell.profileButton!.tag = indexPath.row
        cell.profileButton!.addTarget(self, action: "tappedProfile:", forControlEvents: UIControlEvents.TouchUpInside)
        
//        cell.button.addOnTapGestureRecognizer -- pass in the indexPath into the method. Pass in a method that will take in TweetsViewController Class.
        // That will performSEgue
        
        return cell
    }
    
    func tappedProfile( button: UIButton ) {
        print("tappedProfile")
        print("\(button.tag)")
        
        self.performSegueWithIdentifier("TweetToProfileSegue", sender: button)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TweetComposeSegue" {
            let tweetComposeViewController = segue.destinationViewController as! TweetComposeViewController
            tweetComposeViewController.delegate = self
        } else if segue.identifier == "TweetDetailsSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)!
            let tweet = tweets![indexPath.row]
            
            let tweetDetailsViewController = segue.destinationViewController as! TweetDetailsViewController
            tweetDetailsViewController.tweet = tweet
        } else if segue.identifier == "TweetToProfileSegue" {
            let button = sender as! UIButton
            let indexPath = button.tag
            let tweet = tweets![indexPath]
            let user = tweet.user!
            
            let profileVC = segue.destinationViewController as! ProfileViewController
            profileVC.profileUser = user
//            profileVC.setUser(user: user)
        }
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }
    func tweetComposeViewControllerDelegate(tweetComposeViewController: TweetComposeViewController, didComposeTweet tweet: Tweet) {
        // insert tweet into tweets
        // reload tableView
        tweets?.insert(tweet, atIndex: 0)
        self.tableView.reloadData()
    }
}
