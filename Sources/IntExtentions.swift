//
//  IntExtentions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 16/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Int {
    /// EZSE: Checks if the integer is even.
    public var isEven: Bool     { return (self % 2 == 0) }
    
    /// EZSE: Checks if the integer is odd.
    public var isOdd: Bool      { return (self % 2 != 0) }
    
    /// EZSE: Checks if the integer is positive.
    public var isPositive: Bool { return (self > 0) }
    
    /// EZSE: Checks if the integer is negative.
    public var isNegative: Bool { return (self < 0) }
    
    /// EZSE: Converts integer value to Double.
    public var toDouble: Double { return Double(self) }
    
    /// EZSE: Converts integer value to Float.
    public var toFloat: Float   { return Float(self) }
    
    /// EZSE: Converts integer value to CGFloat.
    public var toCGFloat: CGFloat { return CGFloat(self) }
    
    /// EZSE: Converts integer value to String.
    public var toString: String { return String(self) }
    
    /// EZSE: Converts integer value to UInt.
    public var toUInt: UInt { return UInt(self) }
    
    /// EZSE: Returns number of digits in the integer.
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1; //out of bound
        }
    }
    
    /// EZSE: Executes 'action' this many times.
    public func times(action: (Int) -> ()) {
        if self > 0 {
            for index in 0..<self {
                action(index)
            }
        }
    }

}

extension UInt {
    /// EZSE: Convert UInt to Int
    public var toInt: Int { return Int(self) }
}



