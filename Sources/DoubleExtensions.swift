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
    
    /// rounds Double to x decimalPlaces
    func formatWithDecimalPlaces(decimalPlaces: Int) -> Double {
        let formattedString = NSString(format: "%.\(decimalPlaces)f", self) as String
        return Double(formattedString)!
    }
}
