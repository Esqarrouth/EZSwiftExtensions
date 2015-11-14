//
//  UILabelExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UILabel {
    
    /// EZSwiftExtensions: fontSize: 17
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, w: w, h: h, fontSize: 17)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fontSize: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        font = UIFont.HelveticaNeue(type: FontType.None, size: fontSize)
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        textAlignment = NSTextAlignment.Left
        userInteractionEnabled = true
        numberOfLines = 1
    }
    
    /// EZSwiftExtensions
    func getEstimatedSize(width: CGFloat = CGFloat.max, height: CGFloat = CGFloat.max) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    /// EZSwiftExtensions
    func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: w, height: CGFloat.max)).height
    }
    
    /// EZSwiftExtensions
    func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.max, height: h)).width
    }

    /// EZSwiftExtensions
    func fitHeight() {
        self.h = getEstimatedHeight()
    }
    
    /// EZSwiftExtensions
    func fitWidth() {
        self.w = getEstimatedWidth()
    }
    
    /// EZSwiftExtensions
    func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
 
}



