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

    /// EZSwiftExtensions
    static func enumerated() -> EnumeratedSequence<AnySequence<Case>> {
        return AnySequence(iterator).enumerated()
    }

    /// EZSwiftExtensions
    static var cases: [Case] {
        return Array(iterator)
    }

    /// EZSwiftExtensions
    static var count: Int {
        return cases.count
    }
}
