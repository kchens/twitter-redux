//
//  ContainerViewController.swift
//  Twitter
//
//  Created by Kevin Chen on 10/7/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var detailContainerView: UIView!
    
//    var viewControllers: [UIViewController] = [
//        TweetsViewController(),
//        TweetComposeViewController()
//    ]
    
    override func viewDidLayoutSubviews() {
        defaultMenuPosition()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTimelineView()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTimelineTap(sender: AnyObject) {
        loadTimelineView()
    }
    
    func defaultMenuPosition() {
        scrollView.setContentOffset(CGPoint(x: 80,y: 0), animated: false)
    }
    
    func loadTimelineView() {
        defaultMenuPosition()
        let tweetsNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TweetsNavigationController") as UIViewController
        
        self.addChildViewController(tweetsNavigationController)
        tweetsNavigationController.view.frame = self.detailContainerView.bounds
        tweetsNavigationController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.detailContainerView.addSubview(tweetsNavigationController.view)
        tweetsNavigationController.didMoveToParentViewController(self)

    }
    
    @IBAction func onProfileTap(sender: AnyObject) {
        let profileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        
        self.addChildViewController(profileViewController)
        profileViewController.view.frame = self.detailContainerView.bounds
        profileViewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.detailContainerView.addSubview(profileViewController.view)
        profileViewController.didMoveToParentViewController(self)
        profileViewController.setUserDelegate(setUser: User.currentUser!)
//        profileViewController.profileUser = User.currentUser!
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
