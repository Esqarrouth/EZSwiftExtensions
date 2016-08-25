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
        return castToDecimalByPlacesHelper(places, function: round)
    }

    /// EZSE: Rounds the current Double rounded to decimal
    public mutating func roundByPlaces(places: Int) {
        self = castToDecimalByPlacesHelper(places, function: round)
    }

    /// EZSE: Returns a Double Ceil to decimal
    public func getCeiledByPlaces(places: Int) -> Double {
        return castToDecimalByPlacesHelper(places, function: ceil)
    }

    private func castToDecimalByPlacesHelper(places: Int, function: Double -> Double) -> Double {
        let divisor = pow(10.0, Double(places))
        return function(self * divisor) / divisor
    }
}

extension String {
    init(_ value: Float, precision: Int) {
        let nFormatter = NSNumberFormatter()
        nFormatter.numberStyle = .DecimalStyle
        nFormatter.maximumFractionDigits = precision
        self = nFormatter.stringFromNumber(value)!
    }

    init(_ value: Double, precision: Int) {
        let nFormatter = NSNumberFormatter()
        nFormatter.numberStyle = .DecimalStyle
        nFormatter.maximumFractionDigits = precision
        self = nFormatter.stringFromNumber(value)!
    }
}
