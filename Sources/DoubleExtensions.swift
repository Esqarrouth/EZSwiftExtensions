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
}

extension Double {
    /// EZSE: Returns a Double rounded to decimal
    public func getRoundedByPlaces(_ places: Int) -> Double {
        return castToDecimalByPlacesHelper(places, function: Darwin.round)
    }

    /// EZSE: Rounds the current Double rounded to decimal
    public mutating func roundByPlaces(_ places: Int) {
        self = castToDecimalByPlacesHelper(places, function: Darwin.round)
    }

    /// EZSE: Returns a Double Ceil to decimal
    public func getCeiledByPlaces(_ places: Int) -> Double {
        return castToDecimalByPlacesHelper(places, function: Darwin.ceil)
    }

    /// EZSE: Ceils current Double to number of places
    public mutating func ceilByPlaces(_ places: Int) {
        self = castToDecimalByPlacesHelper(places, function: Darwin.ceil)
    }

    fileprivate func castToDecimalByPlacesHelper(_ places: Int, function: (Double) -> Double) -> Double {
        guard places >= 0 else { return self }
        let divisor = pow(10.0, Double(places))
        return function(self * divisor) / divisor
    }
}
