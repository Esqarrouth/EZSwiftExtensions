//
//  EnumTests.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2017/08/26.
//  Copyright © 2017年 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class EnumTests: XCTestCase {
    enum Fruit: EnumCollection {
        case apple, orange, banana
    }

    func testEnumerated() {
        for (i, fruit) in Fruit.enumrated() {
            switch i {
            case 0:
                XCTAssertEqual(fruit, .apple)
            case 1:
                XCTAssertEqual(fruit, .orange)
            case 2:
                XCTAssertEqual(fruit, .banana)
            }
        }
    }

    func testCases() {
        let cases = Fruit.cases
        XCTAssertEqual(cases[0], .apple)
        XCTAssertEqual(cases[1], .orange)
        XCTAssertEqual(cases[2], .banana)
    }

    func testCount() {
        XCTAssertEqual(Fruit.count, 3)
    }
}
