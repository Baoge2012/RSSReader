//
//  ViewController.swift
//  RSSReader
//
//  Created by Mingbao on 15/3/1.
//  Copyright (c) 2015年 Mingbao. All rights reserved.
//

import UIKit

class RSSHotListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func request(){
        HTTPEngine.request(method: "POST", url: "http://pitayaswift.sinaapp.com/pitaya.php", params:["post": "Network"], callback: { (data, response, error) -> Void in
            print("just wat for 5 seconds")
            sleep(5)
            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
            print(string)
        })
    }


}

