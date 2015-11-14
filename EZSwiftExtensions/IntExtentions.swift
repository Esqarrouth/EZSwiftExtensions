//
//  IntExtentions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 16/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Int {
    /// EZSwiftExtensions
    var isEven: Bool     { return (self % 2 == 0) }
    /// EZSwiftExtensions
    var isOdd: Bool      { return (self % 2 != 0) }
    /// EZSwiftExtensions
    var isPositive: Bool { return (self >= 0) }
    /// EZSwiftExtensions
    var isNegative: Bool { return (self < 0) }
    /// EZSwiftExtensions
    var toDouble: Double { return Double(self) }
    /// EZSwiftExtensions
    var toFloat: Float   { return Float(self) }
    /// EZSwiftExtensions
    var toCGFloat: CGFloat { return CGFloat(self) }
    
    /// EZSwiftExtensions
    var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1; //out of bound
        }
    }
    
    /// EZSwiftExtensions - Execute action this many times
    func times(action: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                action()
            }
        }
    }

}

extension UInt {
    /// EZSwiftExtensions
    var toInt: Int { return Int(self) }
}



