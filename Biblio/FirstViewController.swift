//
//  FirstViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/2/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import UIKit
import Parse

class FirstViewController: UIViewController {

    @IBOutlet weak var WebVideo: UIWebView!
    @IBOutlet weak var WebVideo2: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        
        var html1 = "<iframe width=\"280\" height=\"180\" src=\"https://www.youtube.com/embed/UQUgSX_J3gc?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        var html2 = "<iframe width=\"280\" height=\"180\" src=\"https://www.youtube.com/embed/xx6iu5DoLKE?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        
        
        WebVideo.loadHTMLString(html1, baseURL: nil)
        WebVideo2.loadHTMLString(html2, baseURL: nil)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

