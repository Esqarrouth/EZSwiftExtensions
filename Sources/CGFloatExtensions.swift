//
//  CEMKit+CGFloat.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension CGFloat {
    /// EZSwiftExtensions
    public var center: CGFloat { return (self / 2) }
  
    /// EZSwiftExtensions
    public func toRadians() -> CGFloat {
        return (CGFloat (M_PI) * self) / 180.0
    }
  
    /// EZSwiftExtensions
    public func degreesToRadians() -> CGFloat {
        return toRadians()
    }
  
    /// EZSwiftExtensions
    public mutating func toRadiansInPlace() {
        self = (CGFloat (M_PI) * self) / 180.0
    }
}




