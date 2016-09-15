//
//  DoubleExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Goktug Yilmaz on 12/19/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit
import Foundation

extension Double {
    /// EZSE: Converts Double to String
    public var toString: String { return String(self) }
    /// EZSE: Converts Double to Int
    public var toInt: Int { return Int(self) }

    /// EZSE: Returns a Double rounded to decimal
    public mutating func getRoundedByPlaces(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places)) as Double
        var result = Double(self * divisor) / divisor
        result.round(.toNearestOrAwayFromZero)
        return result
    }

    /// EZSE: Rounds the current Double rounded to decimal
    public mutating func roundByPlaces(_ places: Int) {
        let divisor = pow(10.0, Double(places))
        var result = (self * divisor) / divisor
        result.round(.toNearestOrAwayFromZero)
        self = result
    }
    
    /// EZSE: Returns a Double Ceil to decimal
    public func getCeiledByPlaces(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ceil(self * divisor) / divisor
    }
}
