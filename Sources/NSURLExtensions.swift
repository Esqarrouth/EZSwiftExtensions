//
//  NSURLExtensions.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2016/01/11.
//  Copyright (c) 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension NSURL {
    /// EZSE: Returns convert query to Dictionary
    public var queryParameters: [String: String]? {
        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true), queryItems = components.queryItems else {
            return nil
        }

        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }
}
