//
//  NSUserDefaultsExtension.swift
//  EZSwiftExtensions
//
//  Created by Vinay on 12/1/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import Foundation

public extension NSUserDefaults {
    public subscript(key: String) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        set {
            setObject(newValue, forKey: key)
        }
    }
}
