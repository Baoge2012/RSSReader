//
//  RSSHotListViewModel.swift
//  RSSReader
//
//  Created by Mingbao on 10/29/15.
//  Copyright © 2015 Mingbao. All rights reserved.
//

import Foundation
import AVOSCloud

class RSSHotListViewModel {
    func getHotList() {//(AVCloudQueryResult!, NSError!)
        AVQuery.doCloudQueryInBackgroundWithCQL("select * from RSSFeed where hot > 40 order by hot limit 0,40", callback: { queryREsult, error in
            guard error == nil else {
                print("failed")
                return
            }
            guard let result = queryREsult else {
                print("failed")
                return
            }
            print("succeed \(result)")
        })
    }
    
    class func saveRSSFeed() {
        let feed = AVObject(className: "RSSFeed")
        feed.setObject("http://onevcat.com/rss/", forKey: "link")
        feed.setObject("OneV's Den", forKey: "title")
        feed.setObject("嗨，我是王巍 (@onevcat)，一名来自中国的 iOS / Unity 开发者。现居日本，就职于 LINE。正在修行，探求创意之源。", forKey: "description")
        feed.setObject("Ghost 0.7", forKey: "generator")
        feed.setObject("http://onevcat.com/rss/", forKey: "atom")
        feed.setObject(Int(90), forKey: "hot")
        
        feed.saveInBackground()
    }
}