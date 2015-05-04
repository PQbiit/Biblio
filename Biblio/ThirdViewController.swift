//
//  ThirdViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/3/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import UIKit
import Parse
import TwitterKit


class ThirdViewController: UIViewController, TWTRTweetViewDelegate
{
    
    @IBOutlet weak var tblTweetFeed: UITableView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ImageViewLogoTwitter: UIImageView!
    
    @IBAction func btnlogout(sender: AnyObject) {
        Twitter.sharedInstance().logOut()
    }
    
    let tweetTableReuseIdentifier = "TweetCell"
    // Hold all the loaded Tweets
    var tweets: [TWTRTweet] = [] {
        didSet {
            tblTweetFeed.reloadData()
        }
    }
    let tweetIDs = ["20", // @jack's first Tweet
        "510908133917487104"] // our favorite bike Tweet
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tblTweetFeed.hidden = true
        
        // START --- TWITTER LOG IN BUTTON
        
        let logInButton = TWTRLogInButton(logInCompletion:
            { (session, error) in
                if (session != nil)
                {
                    self.tblTweetFeed.hidden = false
                    self.tblTweetFeed.reloadData()
                    println("signed in as \(session.userName)");
                    
                    
                } else {
                    println("error: \(error.localizedDescription)");
                }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
        
        // START --- TWITTER LOG IN LOAD MULTIPLE TWEETS
        
        let tweetIDs = ["20", "510908133917487104"]
        Twitter.sharedInstance().APIClient
            .loadTweetsWithIDs(tweetIDs) {
                (tweets, error) -> Void in
                // handle the response or error
        }
        
        
        // START --- TWITTER LOAD MULTIPLE TWEETS IN TABLE VIEW
        
        // Setup the table view
        tblTweetFeed.estimatedRowHeight = 150
        tblTweetFeed.rowHeight = UITableViewAutomaticDimension // Explicitly set on iOS 8 if using automatic row height calculation
        tblTweetFeed.allowsSelection = false
        tblTweetFeed.registerClass(TWTRTweetTableViewCell.self, forCellReuseIdentifier: tweetTableReuseIdentifier)
        
        // Load Tweets
        Twitter.sharedInstance().APIClient.loadTweetsWithIDs(tweetIDs) { tweets, error in
            if let ts = tweets as? [TWTRTweet] {
                self.tweets = ts
            } else {
                println("Failed to load tweets: \(error.localizedDescription)")
            }
        }
        
        
    
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    
    }
    
    

    
}