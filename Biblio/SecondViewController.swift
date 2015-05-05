//
//  SecondViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/2/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import UIKit
import Parse

class SecondViewController: UIViewController {
    
    @IBOutlet weak var WebViewPiso4: UIWebView!
    @IBOutlet weak var WebViewPiso3: UIWebView!
    @IBOutlet weak var WebViewPiso2: UIWebView!
    @IBOutlet weak var WebViewPiso1: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var TourPiso1 = "<iframe width=\"400\" height=\"118\" src=\"https://www.youtube.com/embed/rW3s8w1bzVg?list=PLnncon5XHt5p-GwkOQsb1NrGg5mVkNW3e&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        var TourPiso2 = "<iframe width=\"400\" height=\"118\" src=\"https://www.youtube.com/embed/u4mCGfkSI_w?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        var TourPiso3 = "<iframe width=\"400\" height=\"118\" src=\"https://www.youtube.com/embed/rW3s8w1bzVg?list=PLnncon5XHt5p-GwkOQsb1NrGg5mVkNW3e&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        var TourPiso4 = "<iframe width=\"400\" height=\"118\" src=\"https://www.youtube.com/embed/B0uyTBALR7Y?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        WebViewPiso1.loadHTMLString(TourPiso1, baseURL: nil)
        WebViewPiso2.loadHTMLString(TourPiso2, baseURL: nil)
        WebViewPiso3.loadHTMLString(TourPiso3, baseURL: nil)
        WebViewPiso4.loadHTMLString(TourPiso4, baseURL: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

