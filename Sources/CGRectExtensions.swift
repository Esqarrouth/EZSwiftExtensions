//
//  CGRectExtensions.swift
//  Qorum
//
//  Created by Goktug Yilmaz on 26/08/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension CGRect {
    /// EZSE: Easier initialization of CGRect
    public init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }

    /// EZSE: X value of CGRect's origin
    public var x: CGFloat {
        get {
            return self.origin.x
        } set(value) {
            self.origin.x = value
        }
    }

    /// EZSE: Y value of CGRect's origin
    public var y: CGFloat {
        get {
            return self.origin.y
        } set(value) {
            self.origin.y = value
        }
    }

    /// EZSE: Width of CGRect's size
    public var w: CGFloat {
        get {
            return self.size.width
        } set(value) {
            self.size.width = value
        }
    }

    /// EZSE: Height of CGRect's size
    public var h: CGFloat {
        get {
            return self.size.height
        } set(value) {
            self.size.height = value
        }
    }

}
