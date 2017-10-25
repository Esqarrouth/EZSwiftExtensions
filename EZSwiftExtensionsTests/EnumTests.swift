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
        for (i, fruit) in Fruit.enumerated() {
            switch (i, fruit) {
            case (0, .apple),
                 (1, .orange),
                 (2, .banana):
                XCTAssertTrue(true)
            default:
                XCTFail()
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
