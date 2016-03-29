//
//  UIColoredView.swift
//  InstaApp
//
//  Created by Goktug Yilmaz on 26/10/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit
//TODO: readme
class UIColoredView: UIView {
    init() {
        super.init(frame: CGRect(x: 100, y: 100, w: 100, h: 100))
        backgroundColor = UIColor.randomColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
