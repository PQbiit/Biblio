//
//  TweetListViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/3/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//



import UIKit
import TwitterKit

class TwitterViewController: UITableViewController, TWTRTweetViewDelegate {
    
    let tweetTableReuseIdentifier = "TweetCell"
    // Hold all the loaded Tweets
    var tweets: [TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let tweetIDs = ["20", // @jack's first Tweet
        "510908133917487104","20"] // our favorite bike Tweet
    
    override func viewDidLoad() {
        // Setup the table view
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension // Explicitly set on iOS 8 if using automatic row height calculation
        tableView.allowsSelection = false
        tableView.registerClass(TWTRTweetTableViewCell.self, forCellReuseIdentifier: tweetTableReuseIdentifier)
        
        Twitter.sharedInstance().logInGuestWithCompletion { guestSession, error in
            if (guestSession != nil) {
                // make API calls that do not require user auth
            } else {
                println("error: \(error.localizedDescription)");
            }
        }
        // Load Tweets
        Twitter.sharedInstance().APIClient.loadTweetsWithIDs(tweetIDs) { tweets, error in
            if let ts = tweets as? [TWTRTweet] {
                self.tweets = ts
            } else {
                println("Failed to load tweets: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: UITableViewDelegate Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tweet = tweets[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(tweetTableReuseIdentifier, forIndexPath: indexPath) as! TWTRTweetTableViewCell
        cell.tweetView.delegate = self
        cell.configureWithTweet(tweet)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        return TWTRTweetTableViewCell.heightForTweet(tweet, width: CGRectGetWidth(self.view.bounds))
    }
}