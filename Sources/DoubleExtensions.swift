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

//MARK: - Deprecated 1.8

extension Double {

    /// EZSE: Returns a Double rounded to decimal
    @available(*, deprecated: 1.8, renamed: "rounded(toPlaces:)")
    public func getRoundedByPlaces(_ places: Int) -> Double {
        return rounded(toPlaces: places)
    }

    /// EZSE: Rounds the current Double rounded to decimal
    @available(*, deprecated: 1.8, renamed: "round(toPlaces:)")
    public mutating func roundByPlaces(_ places: Int) {
        self.round(toPlaces: places)
    }

    /// EZSE: Returns a Double Ceil to decimal
    @available(*, deprecated: 1.8, renamed: "ceiled(toPlaces:)")
    public func getCeiledByPlaces(_ places: Int) -> Double {
        return ceiled(toPlaces: places)
    }

    /// EZSE: Ceils current Double to number of places
    @available(*, deprecated: 1.8, renamed: "ceil(toPlaces:)")
    public mutating func ceilByPlaces(_ places: Int) {
        self.ceil(toPlaces: places)
    }

}
