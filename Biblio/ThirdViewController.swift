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
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ImageViewLogoTwitter: UIImageView!
    
    @IBAction func btnlogout(sender: AnyObject) {
        Twitter.sharedInstance().logOut()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // START --- TWITTER LOG IN BUTTON
        
        let logInButton = TWTRLogInButton(logInCompletion:
            { (session, error) in
                if (session != nil)
                {
                    println("signed in as \(session.userName)");
                    
                    
                } else {
                    println("error: \(error.localizedDescription)");
                }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
        
        // START --- TWEET FEED
        
        let client = Twitter.sharedInstance().APIClient
        let dataSource = TWTRSearchTimelineDataSource(searchQuery: "#SanFrancisco", APIClient: client)
        
        
    
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    
    }
    
    
    
}

