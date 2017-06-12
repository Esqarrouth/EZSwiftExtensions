//
//  CGFloatTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest

@testable import EZSwiftExtensions

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
    
    func testRadiansToDegrees() {
        XCTAssertEqual(degrees, radians.radiansToDegrees())
    }
    
    func testRadiansToDegreesStaticVersion() {
        XCTAssertEqual(CGFloat.radiansToDegrees(radians), degrees)
    }
    
    func testRadiansToDegreesMutableVersion() {
        var mutableRadians: CGFloat!
        mutableRadians = 2 * .pi
        mutableRadians.toDegreesInPlace()
        XCTAssertEqual(mutableRadians, degrees)
    }

    func testRandom() {
        let randomCGFloat = CGFloat.random()
        XCTAssertGreaterThanOrEqual(randomCGFloat, 0.0)
        XCTAssertLessThanOrEqual(randomCGFloat, 1.0)
    }
    
    func testRandomWithinRange() {
        let range = CGFloat(0.0)...CGFloat(10.0)
        let randomCGFloat = CGFloat.random(within: range)
        XCTAssertGreaterThanOrEqual(randomCGFloat, 0.0)
        XCTAssertLessThanOrEqual(randomCGFloat, 10.0)
        
        let closedRange = CGFloat(0.0)..<CGFloat(10.0)
        let randomClosedCGFloat = CGFloat.random(within: closedRange)
        XCTAssertGreaterThanOrEqual(randomClosedCGFloat, 0.0)
        XCTAssertLessThanOrEqual(randomClosedCGFloat, 10.0)
    }
    
    func testShortestAngleBetweenInRadiansSanityTest() {
        let firstAngle = CGFloat(0)
        let secondAngle = CGFloat(1)
        
        let shortestAngle = CGFloat.shortestAngleInRadians(from: firstAngle, to: secondAngle)
        XCTAssertNotNil(shortestAngle)
        
        XCTAssertEqual(shortestAngle, secondAngle - firstAngle)
    }
    
    func testShortestAngleFullCirclePi() {
        let firstAngle = CGFloat(0)
        let fullCircleAngle = CGFloat(2 * Double.pi)
        
        let shortestAngle = CGFloat.shortestAngleInRadians(from: firstAngle, to: fullCircleAngle)
        XCTAssertNotNil(shortestAngle)
        
        XCTAssertEqual(shortestAngle, 0)
    }
    
    func testShortestAngleThreeFourthsCirclePi() {
        let firstAngle = CGFloat(0)
        let threeFourthsCircleAngle = CGFloat(1.5 * Double.pi)
        
        let shortestAngle = CGFloat.shortestAngleInRadians(from: firstAngle, to: threeFourthsCircleAngle)
        XCTAssertNotNil(shortestAngle)
        
        XCTAssertEqual(shortestAngle, -0.5 * .pi)
    }
}

#endif
