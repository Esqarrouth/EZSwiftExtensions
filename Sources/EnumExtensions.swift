//
//  EnumExtensions.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2017/08/26.
//  Copyright © 2017年 Goktug Yilmaz. All rights reserved.
//

import Foundation

protocol EnumCollection {
    associatedtype Case = Self
}

extension EnumCollection where Case: Hashable {
    fileprivate static var iterator: AnyIterator<Case> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }

            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Case.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }

    /// EZSE: Returns the sequence
    static func enumerated() -> EnumeratedSequence<AnySequence<Case>> {
        return AnySequence(iterator).enumerated()
    }

    /// EZSE: Returns the list that contains all enumeration case
    static var cases: [Case] {
        return Array(iterator)
    }

    /// EZSE: Returns the number of enumeration case
    static var count: Int {
        return cases.count
    }
}
