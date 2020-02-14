//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Tu A Nguyen on 2/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false

    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
  
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorite(isFavorited: true)}, failure: { (error) in print("Favorite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorite(isFavorited: false)}, failure: { (error) in print("Unfavorite did not succeed: \(error)")
                
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {self.setRetweeted(isRetweeted: true)}, failure: { (error) in print("Error is retweeting: \(error)") })
        
    }
    
    func setRetweeted(isRetweeted:Bool) {
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "favor-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavorite( isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage((UIImage(named:"favor-icon-red")), for: UIControl.State.normal)
        }
        else {
            favButton.setImage((UIImage(named:"favor-icon")), for: UIControl.State.normal)
        }
    } 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
