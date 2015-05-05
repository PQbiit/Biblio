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
    
    @IBOutlet weak var TweetBtn: UIButton!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var btnGoToFeed: UIButton!
    @IBOutlet weak var btnlogout: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ImageViewLogoTwitter: UIImageView!
    
    @IBAction func TweetBtn(sender: AnyObject) {
        // TWITER --- START TWEET COMPOSITION
        
        let composer = TWTRComposer()
        
        composer.setText("#Biblio")
        composer.setImage(UIImage(named: "fabric"))
        
        composer.showWithCompletion { (result) -> Void in
            if (result == TWTRComposerResult.Cancelled) {
                println("Tweet composition cancelled")
            }
            else {
                println("Sending tweet!")
            }
        }
    
    }
    
    
    
    @IBAction func loginbtn(sender: AnyObject){
        Twitter.sharedInstance().logInWithCompletion {
            (session, error) -> Void in
            if (session != nil) {
                println("signed in as \(session.userName)");
                
                self.btnlogout.hidden = false
                self.btnGoToFeed.hidden = false
                self.loginbtn.hidden = true
                self.TweetBtn.hidden = false
                
                
                // TWITER --- START TWEET COMPOSITION
                
                let composer = TWTRComposer()
                
                composer.setText("#Biblio")
                composer.setImage(UIImage(named: "fabric"))
                
                composer.showWithCompletion { (result) -> Void in
                    if (result == TWTRComposerResult.Cancelled) {
                        println("Tweet composition cancelled")
                    }
                    else {
                        println("Sending tweet!")
                    }
                }
                
                
                
            } else {
                println("error: \(error.localizedDescription)");
            }
        }
    }
    
    
    @IBAction func btnlogout(sender: AnyObject) {
        Twitter.sharedInstance().logOut()
        self.btnlogout.hidden = true
        self.btnGoToFeed.hidden = true
        self.loginbtn.hidden = false
        self.TweetBtn.hidden = true
        
    }
    
    @IBAction func btnGoToFeed(sender: AnyObject) {
        
        let vc = SearchTimelineViewController()
        self.presentViewController(vc, animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Twitter.sharedInstance().logOut()
        self.btnGoToFeed.hidden = true
        self.btnlogout.hidden = true
        self.TweetBtn.hidden = true
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
    
    
    
}

