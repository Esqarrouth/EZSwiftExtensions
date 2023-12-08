//
//  UIButtonExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

extension UIButton {
	/// EZSwiftExtensions

	public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, target: AnyObject, action: Selector) {
		self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        addTarget(target, action: action, for: UIControl.Event.touchUpInside)
	}

	/// EZSwiftExtensions: Set a background color for the button.
    public func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
		UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
		let colorImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		self.setBackgroundImage(colorImage, for: forState)
	}
}

#endif
