//
//  UIEdgeInsets.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2017/01/19.
//  Copyright © 2017年 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    /// EZSE: Easier initialization of UIEdgeInsets
    public init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
