//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Kevin Chen on 10/3/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    var tweet: Tweet!
    
    @IBOutlet weak var tweetUserImageView: UIImageView!
    @IBOutlet weak var tweetUserNameLabel: UILabel!
    @IBOutlet weak var tweetUserScreenNameLabel: UILabel!
    @IBOutlet weak var tweetCreatedAtLabel: UILabel!
    @IBOutlet weak var tweetDescriptionLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetUserImageView.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl)!))
        tweetUserNameLabel.text = tweet.user?.name
        tweetUserScreenNameLabel.text = tweet.user?.screenname
        tweetCreatedAtLabel.text = tweet.createdAtFormatted
        tweetDescriptionLabel.text = tweet.text

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(tweet.tweetId) { (tweet, error) -> () in
            if tweet == nil {
                print("TweetDetailsViewController - Retweeted error: \(error)")
            } else {
                print("TweetDetailsViewController - Got retweeted")
                self.retweetButton.setTitle("Retweeted", forState: .Normal)
            }
        }
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        TwitterClient.sharedInstance.favorite(tweet.tweetId) { (tweet, error) -> () in
            if tweet == nil {
                print("TweetDetailsViewController - Favorited error: \(error)")
            } else {
                print("TweetDetailsViewController - Got favorited")
                self.favoriteButton.setTitle("Favorited", forState: .Normal)
            }
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TweetReplySegue" {
            let composeVC = segue.destinationViewController as! TweetComposeViewController
            composeVC.tweet = self.tweet
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
