//
//  FloatingPointExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Olexii Pyvovarov on 9/29/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension FloatingPoint {

    private func divisor(forPlaces places: Int) -> Self {
        switch places {
        case 0: return Self(1)
        case 1: return Self(10)
        case 2: return Self(100)
        case 3: return Self(1000)
        case 4: return Self(10000)
        case 5: return Self(100000)
        case 6: return Self(1000000)
        case 7: return Self(10000000)
        case 8: return Self(100000000)
        default: return Self(100000000).multiplied(by: divisor(forPlaces: places - 8))
        }
    }

    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        //Float80 max decimal places = 18
        guard places <= 24 else { return rounded(toPlaces: 24) }
        let div = divisor(forPlaces: places)
        return (self * div).rounded() / div
    }


    public mutating func round(toPlaces places: Int) {
        self = rounded(toPlaces: places)
    }

    public func ceiled(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        //Float80 max decimal places = 18
        guard places <= 24 else { return ceiled(toPlaces: 24) }
        let div = divisor(forPlaces: places)
        return (self * div).rounded(.up) / div
    }

    public mutating func ceil(toPlaces places: Int) {
        self = ceiled(toPlaces: places)
    }

}
