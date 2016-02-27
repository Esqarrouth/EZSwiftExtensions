//
//  UIColorExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIColor {
    
    /// EZSE: init method with RGB values from 0 to 255, instead of 0 to 1
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    /// EZSwiftExtensions
    public convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
        let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
        let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// EZSwiftExtensions
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var formatted = hexString.stringByReplacingOccurrencesOfString("0x", withString: "")
        formatted = formatted.stringByReplacingOccurrencesOfString("#", withString: "")
        if let hex = Int(formatted, radix: 16) {
            self.init(hex: hex, alpha: alpha)
        } else {
            return nil
        }
    }
    
    /// EZSE: init method from Gray value
    public convenience init(gray: CGFloat, alpha: CGFloat = 1) {
        self.init(red: gray/255, green: gray/255, blue: gray/255, alpha: alpha)
    }
    
    /// EZSwiftExtensions
    public var redComponent: Int {
        var r: CGFloat = 0
        getRed(&r, green: nil, blue: nil, alpha: nil)
        return Int(r * 255)
    }

    /// EZSwiftExtensions
    public var greenComponent: Int {
        var g: CGFloat = 0
        getRed(nil, green: &g, blue: nil, alpha: nil)
        return Int(g * 255)
    }
    
    /// EZSwiftExtensions
    public var blueComponent: Int {
        var b: CGFloat = 0
        getRed(nil, green: nil, blue: &b, alpha: nil)
        return Int(b * 255)
    }
    
    /// EZSwiftExtensions
    public var alpha: Int {
        var a: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &a)
        return Int(a)
    }
    
    /// EZSwiftExtensions
    public static func randomColor(randomAlpha: Bool = false) -> UIColor {
        let randomRed = CGFloat.random()
        let randomGreen = CGFloat.random()
        let randomBlue = CGFloat.random()
        let alpha = randomAlpha ? CGFloat.random() : 1.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
   
}

private extension CGFloat {
    /// SwiftRandom extension
    static func random(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}

