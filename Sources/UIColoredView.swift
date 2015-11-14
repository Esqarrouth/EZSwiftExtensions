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

private extension UIColor {
    /// SwiftRandom extension
    static func randomColor(randomAlpha: Bool = false) -> UIColor {
        let randomRed = CGFloat.randomColor()
        let randomGreen = CGFloat.randomColor()
        let randomBlue = CGFloat.randomColor()
        let alpha = randomAlpha ? CGFloat.randomColor() : 1.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
}

private extension CGFloat {
    /// SwiftRandom extension
    static func randomColor(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}
