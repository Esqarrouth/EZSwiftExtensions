//
//  NSObjectExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 16/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

extension NSObject {
    public var className: String {
        return type(of: self).className
    }

    public static var className: String {
        return String(describing: self)
    }
}

#endif
