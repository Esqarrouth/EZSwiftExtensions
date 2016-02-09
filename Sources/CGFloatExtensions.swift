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
}

/// EZSwiftExtensions
public func degreesToRadians (angle: CGFloat) -> CGFloat {
    return (CGFloat (M_PI) * angle) / 180.0
}



