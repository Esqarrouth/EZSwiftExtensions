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
    var negativeDouble = -147.9564
    let minDouble = Double.leastNormalMagnitude
    let maxDouble = Double.greatestFiniteMagnitude

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
        XCTAssertEqual(negativeDouble.toString, "-147.9564")
        XCTAssertEqual(minDouble.toString, "2.2250738585072e-308")
        XCTAssertEqual(maxDouble.toString, "1.79769313486232e+308")
    }

    func testToInt() {
        XCTAssertEqual(double.toInt, 3)
        XCTAssertEqual(negativeDouble.toInt, -147)
        XCTAssertEqual(minDouble.toInt, 0)
//        XCTAssertEqual(maxDouble.toInt) // fatal error double value greater than int max value
        XCTAssertNotEqual(Double(double.toInt), double)
        XCTAssertNotEqual(Double(negativeDouble.toInt), negativeDouble)
        XCTAssertNotEqual(Double(minDouble.toInt), minDouble)
//        XCTAssertNotEqual(Double(maxDouble.toInt), maxDouble) // fatal error double value greater than int max value
    }
    
    func testCGFloat() {
        XCTAssertEqual(double.toCGFloat, 3.14)
        XCTAssertEqual(negativeDouble.toCGFloat, -147.9564)
        XCTAssertEqual(minDouble.toCGFloat, CGFloat.leastNormalMagnitude)
        XCTAssertEqual(maxDouble.toCGFloat, CGFloat.greatestFiniteMagnitude)
    }
    
    func testAbs() {
        XCTAssertEqual(Double(-3.0).abs, Double(3.0))
        XCTAssertEqual(Double(3.0).abs, Double(3.0))
        XCTAssertEqual(Double(0).abs, Double(0))
    }
}
