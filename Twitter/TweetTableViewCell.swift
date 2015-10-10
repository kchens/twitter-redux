//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Kevin Chen on 10/1/15.
//  Copyright © 2015 Kevin Chen. All rights reserved.
//

import UIKit


class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetUserImageView: UIImageView!
    @IBOutlet weak var tweetUserNameLabel: UILabel!
    @IBOutlet weak var tweetUserScreenName: UILabel!
    @IBOutlet weak var tweetCreatedAtLabel: UILabel!
    @IBOutlet weak var tweetDescriptionLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            self.tweetUserImageView.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl)!))
            self.tweetUserNameLabel.text = tweet.user?.name
            self.tweetUserScreenName.text = tweet.user?.screenname
            self.tweetCreatedAtLabel.text = tweet.createdAtFormatted
            self.tweetDescriptionLabel.text = tweet.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
