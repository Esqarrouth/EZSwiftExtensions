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
        
        let value1: Int = 0
        let expected1: Int = 1
        let value2: Int = 50
        let expected2: Int = 2
        
        XCTAssertEqual(value1.digits, expected1)
        XCTAssertEqual(value2.digits, expected2)
    }

    func testConsistency() {
        XCTAssertNotEqual(value.isEven, value.isOdd)
        XCTAssertNotEqual(value.isPositive, value.isNegative)
    }
    
    func testDouble() {
        
        let value1: Int = 399
        let expected1: Double = 399.0
        let value2: Int = -30
        let expected2: Double = -30.0
        
        XCTAssertEqual(value1.toDouble, expected1)
        XCTAssertEqual(value2.toDouble, expected2)
    }
    
    func testFloat() {
        
        let value1: Int = 399
        let expected1: Float = 399.0
        let value2: Int = -30
        let expected2: Float = -30.0
        
        XCTAssertEqual(value1.toFloat, expected1)
        XCTAssertEqual(value2.toFloat, expected2)
    }
    
    func testCGFloat() {
        
        let value1: Int = 399
        let expected1: CGFloat = 399.0
        let value2: Int = -30
        let expected2: CGFloat = -30.0
        
        XCTAssertEqual(value1.toCGFloat, expected1)
        XCTAssertEqual(value2.toCGFloat, expected2)
    }
    
    func testUInt() {
        
        let value1: Int = 399
        let expected1: UInt = 399
        let value2: Int = 0
        let expected2: UInt = 0
        
        XCTAssertEqual(value1.toUInt, expected1)
        XCTAssertEqual(value2.toUInt, expected2)
    }
    
    func testUInt32() {
        
        let value1: Int = 399
        let expected1: Int32 = 399
        let value2: Int = -30
        let expected2: Int32 = -30
        
        XCTAssertEqual(value1.toInt32, expected1)
        XCTAssertEqual(value2.toInt32, expected2)
    }
    
    func testString() {
        
        let value1: Int = 399
        let expected1: String = "399"
        let value2: Int = -30
        let expected2: String = "-30"
        let value3: Int = 0
        let expected3: String = "0"
        
        XCTAssertEqual(value1.toString, expected1)
        XCTAssertEqual(value2.toString, expected2)
        XCTAssertEqual(value3.toString, expected3)
    }
    
    func testRange() {
        
        let value: Int = 0
        let expected: CountableRange<Int> = 0..<value
        
        XCTAssertEqual(value.range, expected)
    }
}
