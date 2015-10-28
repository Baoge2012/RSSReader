//
//  MainViewController.swift
//  RSSReader
//
//  Created by MingbaoZhu on 15/5/19.
//  Copyright (c) 2015年 Mingbao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
 
    var feedinfo:MWFeedInfo = MWFeedInfo()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
