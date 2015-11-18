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
    public var isEven: Bool     { return (self % 2 == 0) }
    /// EZSwiftExtensions
    public var isOdd: Bool      { return (self % 2 != 0) }
    /// EZSwiftExtensions
    public var isPositive: Bool { return (self >= 0) }
    /// EZSwiftExtensions
    public var isNegative: Bool { return (self < 0) }
    /// EZSwiftExtensions
    public var toDouble: Double { return Double(self) }
    /// EZSwiftExtensions
    public var toFloat: Float   { return Float(self) }
    /// EZSwiftExtensions
    public var toCGFloat: CGFloat { return CGFloat(self) }
    /// EZSwiftExtensions
    public var toString: String { return String(self) }
    
    /// EZSwiftExtensions
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1; //out of bound
        }
    }
    
    /// EZSwiftExtensions - Execute action this many times
    public func times(action: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                action()
            }
        }
    }

}

extension UInt {
    /// EZSwiftExtensions
    public var toInt: Int { return Int(self) }
}



