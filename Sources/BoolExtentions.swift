//
//  BoolExtentions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 16/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

extension Bool {
    
    /// EZSE: Toggle boolean value.
    public mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
}




