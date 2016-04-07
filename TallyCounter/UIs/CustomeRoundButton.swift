//
//  CustomeRoundButton.swift
//  TallyCounter
//
//  Created by Luis Wu on 3/31/16.
//  Copyright © 2016 Luis Wu. All rights reserved.
//

import UIKit

class CustomRoundButton: UIButton {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.setTitleColor(UIColor.themeColor(), forState: .Highlighted)
        self.tintColor = UIColor.whiteColor()
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.contentMode = .Redraw
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = UIColor.whiteColor()
            } else {
                backgroundColor = UIColor.clearColor()
            }
        }
    }
}