//
//  CEMKit+CGFloat.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension CGFloat {
    /// EZSE: Return the central value of CGFloat.
    public var center: CGFloat { return (self / 2) }
}

/// EZSE: Converts angle degrees to radians.
public func degreesToRadians (angle: CGFloat) -> CGFloat {
    return (CGFloat (M_PI) * angle) / 180.0
}



