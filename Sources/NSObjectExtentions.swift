//
//  NSObjectExtentions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 16/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension NSObject {
    
    public var className: String {
        return self.dynamicType.className
    }
    
    public static var className: String {
        return stringFromClass(self)
    }

}

public func stringFromClass(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
}
