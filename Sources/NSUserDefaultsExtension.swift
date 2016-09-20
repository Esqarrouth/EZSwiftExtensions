//
//  NSUserDefaultsExtension.swift
//  EZSwiftExtensions
//
//  Created by Vinay on 12/1/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import Foundation

public extension UserDefaults {
    public subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
