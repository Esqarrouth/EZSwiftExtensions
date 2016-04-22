//
//  DoubleExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Goktug Yilmaz on 12/19/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension Double {
    /// EZSE: Converts Double to String
    public var toString: String { return String(self) }
    /// EZSE: Converts Double to Int
    public var toInt: Int { return Int(self) }

    /// EZSE: Returns a Double rounded to decimal
    public func getRoundedByPlaces(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }

    /// EZSE: Rounds the current Double rounded to decimal
    public mutating func roundByPlaces(places: Int) {
        let divisor = pow(10.0, Double(places))
        self = round(self * divisor) / divisor
    }
    
    /// EZSE: Returns a Double Ceil to decimal
    public func getCeiledByPlaces(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ceil(self * divisor) / divisor
    }
}
