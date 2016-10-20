//
//  CGFloatTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class CGFloatTests: XCTestCase {
    var radians: CGFloat!
    var degrees: CGFloat!

    override func setUp() {
        super.setUp()
        radians = 2 * .pi
        degrees = 360
    }

    func testDegreesToRadians() {
        XCTAssertEqual(radians, degrees.degreesToRadians())
    }
    
    func testDegreesToRadiansStaticVersion() {
        XCTAssertEqual(CGFloat.degreesToRadians(degrees), radians)
    }
    
    func testDegreesToRadiansMutableVersion() {
        var mutableDegrees = CGFloat(360)
        mutableDegrees.toRadiansInPlace()
        XCTAssertEqual(mutableDegrees, radians)
    }
    
    func testRandom() {
        let randomCGFloat = CGFloat.random()
        XCTAssertGreaterThanOrEqual(randomCGFloat, 0.0)
        XCTAssertLessThanOrEqual(randomCGFloat, 1.0)
    }
    
    func testRandomWithinRange() {
        let randomCGFloat = CGFloat.random(min: 0.0, max: 10.0)
        XCTAssertGreaterThanOrEqual(randomCGFloat, 0.0)
        XCTAssertLessThanOrEqual(randomCGFloat, 10.0)
    }
}
