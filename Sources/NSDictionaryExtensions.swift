//
//  NSDictionaryExtensions.swift
//  EZSwiftExtensions
//
//  Created by mousavian on 15/11/25.
//  Copyright (c) 2016 Goktug Yilmaz. All rights reserved.
//
// swiftlint:disable line_length

import Foundation

public extension NSDictionary {
    /// EZSE: Unserialize JSON string into NSDictionary
    public convenience init ? (json: String) {
        if let data = (try? JSONSerialization.jsonObject(with: json.data(using: String.Encoding.utf8, allowLossyConversion: true)!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary {
            self.init(dictionary: data)
        } else {
            self.init()
            return nil
        }
    }

    /// EZSE: Serialize NSDictionary into JSON string
    public func formatJSON() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions()) {
            let jsonStr = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            return String(jsonStr ?? "")
        }
        return nil
    }
}
