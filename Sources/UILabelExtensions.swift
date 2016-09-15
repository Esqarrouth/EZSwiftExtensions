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
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, w: w, h: h, fontSize: 17)
    }

    /// EZSwiftExtensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fontSize: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        font = UIFont.HelveticaNeue(type: FontType.None, size: fontSize)
        backgroundColor = UIColor.clear
        clipsToBounds = true
        textAlignment = NSTextAlignment.left
        isUserInteractionEnabled = true
        numberOfLines = 1
    }

    /// EZSwiftExtensions
    public func getEstimatedSize(_ width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }

    /// EZSwiftExtensions
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: w, height: CGFloat.greatestFiniteMagnitude)).height
    }

    /// EZSwiftExtensions
    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: h)).width
    }

    /// EZSwiftExtensions
    public func fitHeight() {
        self.h = getEstimatedHeight()
    }

    /// EZSwiftExtensions
    public func fitWidth() {
        self.w = getEstimatedWidth()
    }

    /// EZSwiftExtensions
    public func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }

    /// EZSwiftExtensions
    public func setText(_ text: String?, animated: Bool, duration: TimeInterval?) {
        if animated {
            UIView.transition(with: self, duration: duration ?? 0.3, options: .transitionCrossDissolve, animations: { () -> Void in
                self.text = text
                }, completion: nil)
        } else {
            self.text = text
        }

    }
}
