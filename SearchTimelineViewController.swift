//
//  SearchTimelineViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/4/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//



import UIKit
import TwitterKit



class SearchTimelineViewController: TWTRTimelineViewController {
    
    
    @IBAction func DoneBtn(sender: AnyObject) {
        
            let VC2 = ThirdViewController()
            self.presentViewController(VC2, animated: true, completion: nil)
        
    }
    
    convenience init() {
        let client = Twitter.sharedInstance().APIClient
        let dataSource = TWTRSearchTimelineDataSource(searchQuery: "#Biblio", APIClient: client)
        
        self.init(dataSource: dataSource)
    }
    
    override required init(dataSource: TWTRTimelineDataSource) {
        super.init(dataSource: dataSource)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
