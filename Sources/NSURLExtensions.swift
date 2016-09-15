//
//  NSURLExtensions.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2016/01/11.
//  Copyright (c) 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension URL {
    /// EZSE: Returns convert query to Dictionary
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }

        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }
}
