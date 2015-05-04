//
//  TWTRTimelineViewController.swift
//  Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/3/15.
//  Copyright (c) 2015 Luis Alfonso Arriaga Quezada. All rights reserved.
//

// Swift

// UserTimelineViewController.swift
import UIKit
import TwitterKit

let client = Twitter.sharedInstance().APIClient
let dataSource = TWTRSearchTimelineDataSource(searchQuery: "#twitterflock", APIClient: client)

class UserTimelineViewController: TWTRTimelineViewController {
    
    
    convenience init() {
        let client = Twitter.sharedInstance().APIClient
        let dataSource = TWTRUserTimelineDataSource(screenName: "fabric", APIClient: client)
        
        self.init(dataSource: dataSource)
    }
    
    override required init(dataSource: TWTRTimelineDataSource) {
        super.init(dataSource: dataSource)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}