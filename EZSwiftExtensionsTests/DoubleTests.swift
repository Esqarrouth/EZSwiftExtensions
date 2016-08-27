//
//  DoubleTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

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
}

extension DoubleTests {

    func testRounding() {
        let savedDouble = double
        double.roundByPlaces(10)
        XCTAssertEqual(double, savedDouble)
        XCTAssertEqual(double.getRoundedByPlaces(5), double)

        let savedOtherDouble = otherDouble
        otherDouble.roundByPlaces(3)
        XCTAssertEqual(otherDouble, -147.956)
        XCTAssertEqual(otherDouble.getRoundedByPlaces(2), -147.96)
        XCTAssertNotEqual(otherDouble, savedOtherDouble)

        anotherDouble.roundByPlaces(3)
        XCTAssertEqual(anotherDouble, 231349.678)
        XCTAssertEqual(anotherDouble.getRoundedByPlaces(-7), 231349.678)
        XCTAssertEqual(anotherDouble.getRoundedByPlaces(0), 231350)
    }

    func testCeiling() {
        XCTAssertEqual(double.getCeiledByPlaces(10), double)
        XCTAssertEqual(double.getCeiledByPlaces(1), 3.2)
        double.ceilByPlaces(1)
        XCTAssertEqual(double, 3.2)
        
        XCTAssertEqual(otherDouble.getCeiledByPlaces(3), -147.956)
        XCTAssertEqual(otherDouble.getCeiledByPlaces(2), -147.95)
        otherDouble.ceilByPlaces(3)
        XCTAssertEqual(otherDouble, -147.956)
        otherDouble.ceilByPlaces(2)
        XCTAssertEqual(otherDouble, -147.95)
        
        XCTAssertEqual(anotherDouble.getCeiledByPlaces(3), 231349.679)
        XCTAssertEqual(anotherDouble.getCeiledByPlaces(-7), 231349.678450342834857392948575)
        XCTAssertEqual(anotherDouble.getCeiledByPlaces(0), 231350)
        anotherDouble.ceilByPlaces(-7)
        XCTAssertEqual(anotherDouble, 231349.678450342834857392948575)
        anotherDouble.ceilByPlaces(3)
        XCTAssertEqual(anotherDouble, 231349.679)
        XCTAssertEqual(anotherDouble.getCeiledByPlaces(3), 231349.679)
        anotherDouble.ceilByPlaces(0)
        XCTAssertEqual(anotherDouble, 231350)

    }

}
