//
//  DoubleTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class DoubleTests: XCTestCase {

    var double = 3.14
    var otherDouble = -147.9564
    var anotherDouble = 231349.678450342834857392948575

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

extension DoubleTests {

    func testToString() {
        XCTAssertEqual(double.toString, "3.14")
        XCTAssertEqual(otherDouble.toString, "-147.9564")
        XCTAssertEqual(anotherDouble.toString, "231349.678450343")
    }

    func testToInt() {
        XCTAssertEqual(double.toInt, 3)
        XCTAssertEqual(otherDouble.toInt, -147)
        XCTAssertEqual(anotherDouble.toInt, 231349)
        XCTAssertNotEqual(Double(double.toInt), double)
        XCTAssertNotEqual(Double(otherDouble.toInt), otherDouble)
        XCTAssertNotEqual(Double(anotherDouble.toInt), anotherDouble)
    }
    
    func testAbs() {
        XCTAssertEqual(Double(-3.0).abs, Double(3.0))
        XCTAssertEqual(Double(3.0).abs, Double(3.0))
        XCTAssertEqual(Double(0).abs, Double(0))
    }
}
