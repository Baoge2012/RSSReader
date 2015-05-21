//
//  MainTableViewCell.swift
//  RSSReader
//
//  Created by MingbaoZhu on 15/5/19.
//  Copyright (c) 2015年 Mingbao. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setup(){
        var seperatorLayer = CALayer()
        seperatorLayer.backgroundColor = UIColor.lightGrayColor().CGColor
        self.contentView.layer.addSublayer(seperatorLayer)
    }
    
//    var row: MainPageRow?{
//        didSet{
//            if let arow = newValue{
//                
//            }
//        }
//    }
    
}
