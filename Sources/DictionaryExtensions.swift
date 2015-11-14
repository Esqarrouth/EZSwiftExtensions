//
//  DictionaryExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Dictionary {
    /// EZSwiftExtensions, combines the first dictionary with the second and returns single dictionary
    func union(other: Dictionary) -> Dictionary {
        var temp = self
        for (key,value) in other {
            temp.updateValue(value, forKey:key)
        }
        return temp
    }
}

/// EZSwiftExtensions
func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}