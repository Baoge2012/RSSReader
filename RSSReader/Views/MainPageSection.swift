
//
//  MainPageSection.swift
//  RSSReader
//
//  Created by MingbaoZhu on 15/5/20.
//  Copyright (c) 2015年 Mingbao. All rights reserved.
//

import UIKit

class MainPageSection: NSObject {
    var rows: [MainPageRow] = Array<MainPageRow>()
    var count: Int{
        get{
            return rows.count
        }
    }
    
    func appendRows(rows: [MainPageRow]){
        if rows.count > 0 {
            rows
        }
    }
}
