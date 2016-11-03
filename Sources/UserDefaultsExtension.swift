//
//  NSUserDefaultsExtension.swift
//  EZSwiftExtensions
//
//  Created by Vinay on 12/1/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension UserDefaults {
    public subscript(key: String) -> AnyObject? {
        get {
            return object(forKey: key) as AnyObject?
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
