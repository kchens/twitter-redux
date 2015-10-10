//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Kevin Chen on 10/8/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController {

    @IBOutlet weak var userBannerImageView: UIImageView!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userScreenNameLabel: UILabel!

    @IBOutlet weak var userTweetCountLabel: UILabel!
    @IBOutlet weak var userFollowingCountLabel: UILabel!
    @IBOutlet weak var userFollowersCountLabel: UILabel!
    
    var profileUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        userBannerImageView.setImageWithURL(NSURL(string: profileUser.profileBannerUrl!)!)
//        userProfileImageView.setImageWithURL(NSURL(string: profileUser.profileImageUrl!)!)
        if profileUser != nil {
            setUserDelegate(setUser: profileUser)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUserDelegate(setUser user: User) {
        profileUser = user
        
        userBannerImageView.setImageWithURL(NSURL(string: profileUser.profileBannerUrl!)!)
        userProfileImageView.setImageWithURL(NSURL(string: profileUser.profileImageUrl!)!)
        userNameLabel.text       = profileUser.name
        userScreenNameLabel.text = profileUser.screenname
        userTweetCountLabel.text = "\(profileUser.tweetsCount!)"
        userFollowersCountLabel.text = "\(profileUser.followersCount!)"
        userFollowingCountLabel.text = "\(profileUser.followingCount!)"
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
