//
//  FloatingPointExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Olexii Pyvovarov on 9/29/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension FloatingPoint {

    /// EZSE: Returns rounded FloatingPoint to specified number of places
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor.multiply(by: 10) }
        return (self * divisor).rounded() / divisor
    }

    /// EZSE: Rounds current FloatingPoint to specified number of places
    public mutating func round(toPlaces places: Int) {
        self = rounded(toPlaces: places)
    }

    /// EZSE: Returns ceiled FloatingPoint to specified number of places
    public func ceiled(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor.multiply(by: 10) }
        return (self * divisor).rounded(.up) / divisor
    }

    /// EZSE: Ceils current FloatingPoint to specified number of places
    public mutating func ceil(toPlaces places: Int) {
        self = ceiled(toPlaces: places)
    }

}
