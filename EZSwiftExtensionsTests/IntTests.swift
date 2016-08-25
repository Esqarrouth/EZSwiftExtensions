//
//  IntTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class IntTests: XCTestCase {
    var value: Int!

    override func setUp() {
        super.setUp()
        value = 64733
    }

    func testDigits() {
        XCTAssertEqual(value.digits, 5)
    }

    func testConsistency() {
        XCTAssertNotEqual(value.isEven, value.isOdd)
        XCTAssertNotEqual(value.isPositive, value.isNegative)
    }
}
