//
//  FloatingPointTests.swift
//  EZSwiftExtensions
//
//  Created by Olexii Pyvovarov on 9/29/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class FloatingPointTests: XCTestCase {

    var piFloat         = Float(3.14159_26535_89793_23846)      //ir: 3.14159274
    var piDouble        = 3.14159_26535_89793_23846             //ir: 3.1415926535897931
    var piFloat80       = Float80(3.14159_26535_89793_23846)    //ir: 3.141592653589793116
    var negativeDouble  = -147.956455                           //ir: -147.95645500000001
    var anotherFloat    = Float32(199.959019)                   //ir: 199.959015
    var bigFloat        = Float80(0.9278766111959092165201989)  //ir: 0.927876611195909251073

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

}

extension FloatingPointTests {

    func testRounding() {
        XCTAssertEqual(piFloat.rounded(toPlaces: 7), 3.1415927)
        XCTAssertEqual(piDouble.rounded(toPlaces: 7), 3.1415927)
        XCTAssertEqual(piFloat80.rounded(toPlaces: 7), 3.1415927)
        piFloat.round(toPlaces: 3)
        XCTAssertEqual(piFloat, 3.142)
        piDouble.round(toPlaces: 2)
        XCTAssertEqual(piDouble, 3.14)
        piFloat80.round(toPlaces: 1)
        XCTAssertEqual(piFloat80, 3.1)

        XCTAssertEqual(negativeDouble.rounded(toPlaces: 2), -147.96)
        negativeDouble.round(toPlaces: 3)
        XCTAssertEqual(negativeDouble, -147.956)

        XCTAssertEqual(anotherFloat.rounded(toPlaces: 0), 200)
        anotherFloat.round(toPlaces: 5)
        XCTAssertEqual(anotherFloat, 199.95902)
        anotherFloat.round(toPlaces: 3)
        XCTAssertEqual(anotherFloat, 199.959)
        XCTAssertEqual(anotherFloat.rounded(toPlaces: 10), 199.959)
        XCTAssertEqual(anotherFloat.rounded(toPlaces: -5), 199.959)
        anotherFloat.round(toPlaces: -77)
        XCTAssertEqual(anotherFloat, 199.959)
        XCTAssertEqual(anotherFloat.rounded(toPlaces: 0), 200)
        anotherFloat.round(toPlaces: 2)
        XCTAssertEqual(anotherFloat, 199.96)

        XCTAssertEqual(bigFloat.rounded(toPlaces: 99), bigFloat)
        XCTAssertEqual(bigFloat.rounded(toPlaces: -99), bigFloat)
        XCTAssertEqual(bigFloat.rounded(toPlaces: 0), 1)
        XCTAssertEqual(bigFloat.rounded(toPlaces: 10), 0.9278766112)
        bigFloat.round(toPlaces: 16)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.round(toPlaces: -1)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.round(toPlaces: 16)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.round(toPlaces: 3)
        XCTAssertEqual(bigFloat, 0.928)
    }

    func testCeiling() {
        XCTAssertEqual(piFloat.ceiled(toPlaces: 5), 3.1416)
        XCTAssertEqual(piDouble.ceiled(toPlaces: 5), 3.1416)
        XCTAssertEqual(piFloat80.ceiled(toPlaces: 5), 3.1416)
        piFloat.ceil(toPlaces: 3)
        XCTAssertEqual(piFloat, 3.142)
        piDouble.ceil(toPlaces: 2)
        XCTAssertEqual(piDouble, 3.15)
        piFloat80.ceil(toPlaces: 1)
        XCTAssertEqual(piFloat80, 3.2)

        XCTAssertEqual(negativeDouble.ceiled(toPlaces: 2), -147.95)
        negativeDouble.ceil(toPlaces: 3)
        XCTAssertEqual(negativeDouble, -147.956)

        XCTAssertEqual(anotherFloat.ceiled(toPlaces: 0), 200)
        anotherFloat.ceil(toPlaces: 4)
        XCTAssertEqual(anotherFloat, 199.9591)
        anotherFloat.ceil(toPlaces: 3)
        XCTAssertEqual(anotherFloat, 199.96)
        XCTAssertEqual(anotherFloat.ceiled(toPlaces: 10), 199.96)
        XCTAssertEqual(anotherFloat.ceiled(toPlaces: -5), 199.96)
        anotherFloat.ceil(toPlaces: -77)
        XCTAssertEqual(anotherFloat, 199.96)
        XCTAssertEqual(anotherFloat.ceiled(toPlaces: 0), 200)
        anotherFloat.ceil(toPlaces: 2)
        XCTAssertEqual(anotherFloat, 199.96)
        anotherFloat.ceil(toPlaces: 1)
        XCTAssertEqual(anotherFloat, 200)

        XCTAssertEqual(bigFloat.ceiled(toPlaces: 99), bigFloat)
        XCTAssertEqual(bigFloat.ceiled(toPlaces: -99), bigFloat)
        XCTAssertEqual(bigFloat.ceiled(toPlaces: 0), 1)
        XCTAssertEqual(bigFloat.ceiled(toPlaces: 10), 0.9278766112)
        bigFloat.ceil(toPlaces: 16)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.ceil(toPlaces: -1)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.ceil(toPlaces: 16)
        XCTAssertEqual(bigFloat, 0.9278766111959093)
        bigFloat.ceil(toPlaces: 3)
        XCTAssertEqual(bigFloat, 0.928)
    }
    
    func testRandom() {
        let randomFloat = Float.random()
        XCTAssertGreaterThanOrEqual(randomFloat, 0.0)
        XCTAssertLessThanOrEqual(randomFloat, 1.0)
    }
    
    func testRandomWithinRange() {
        let closedRange = Float(0.0)..<Float(10.0)
        let randomClosedFloat = Float.random(within: closedRange)
        XCTAssertGreaterThanOrEqual(randomClosedFloat, 0.0)
        XCTAssertLessThanOrEqual(randomClosedFloat, 10.0)
    }
}
