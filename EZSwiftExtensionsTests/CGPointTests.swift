//
//  CGPointTests.swift
//  EZSwiftExtensions
//
//  Created by Sanyal, Arunav on 10/29/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest

@testable import EZSwiftExtensions

class CGPointTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCGVectorConstructorTest() {
        let cgVector = CGVector(dx: 0.1, dy: 0.3)
        let cgPointFromVector = CGPoint(vector: cgVector)
        XCTAssertEqual(cgPointFromVector, CGPoint(x: 0.1, y: 0.3))
    }
    
    func testAngleConstructorTest() {
        let cgAngle = CGFloat(0.5)
        let cgPointFromAngle = CGPoint(angle: cgAngle)
        XCTAssertEqual(cgPointFromAngle, CGPoint(x: cos(0.5), y: sin(0.5)))
    }
    
    func testPlus() {
        let p1 = CGPoint(x: 1, y: 2)
        let p2 = CGPoint(x: 3, y: 4)
        
        XCTAssertEqual(p1 + p2, CGPoint(x: 4, y: 6))
        
        let p = CGPoint(x: 1, y: 1)
        let oppositeP = CGPoint(x: -1, y: -1)
        
        XCTAssertEqual(p + oppositeP, CGPoint(x: 0, y: 0))
    }
    
    func testMinus() {
        let p1 = CGPoint(x: 1, y: 2)
        let p2 = CGPoint(x: 3, y: 4)
        
        XCTAssertEqual(p2 - p1, CGPoint(x:2, y:2))
        XCTAssertEqual(p1 - p1, CGPoint.zero)
    }
    
    func testScalarProduct() {
        let p1 = CGPoint(x:1, y:2)
        XCTAssertEqual(p1 * 3.0, CGPoint(x:3.0, y:6.0))
        
        XCTAssertEqual(CGPoint.zero * 10.0, CGPoint.zero)
    }
    
    func testLinearInterpolation() {
        let p1 = CGPoint(x:0, y:0)
        let p2 = CGPoint(x:1, y:1)
        
        let midPoint = CGPoint.linearInterpolation(startPoint: p1, endPoint: p2, interpolationParam: 0.5)
        XCTAssertEqual(midPoint, CGPoint(x:0.5, y:0.5))
        
        let quarterPoint = CGPoint.linearInterpolation(startPoint: p1, endPoint: p2, interpolationParam: 0.25)
        XCTAssertEqual(quarterPoint, CGPoint(x:0.25, y:0.25))
        
        
        let midPointBetweenP1AndItself = CGPoint.linearInterpolation(startPoint: p1, endPoint: p1, interpolationParam: 0.5)
        XCTAssertEqual(midPointBetweenP1AndItself, p1)
    }
    
    func testDistance() {
        let p1 = CGPoint(x: 3, y: 4)
        let p2 = CGPoint(x: 0, y: 0)
        
        XCTAssertEqual(CGPoint.distance(from: p1, to: p2), 5)
        XCTAssertEqual(CGPoint.distance(from: p2, to: p2), 0)
    }
    
    func testNormalized() {
        let p = CGPoint(x:3, y:4)
        let pNorm = p.normalized()
        
        XCTAssertEqual(pNorm, CGPoint(x:0.6, y:0.8))
        XCTAssertEqual(pNorm.normalized(), pNorm)
    }
    
    func testAngle() {
        let p = CGPoint(x:1, y:1)
        XCTAssertEqual(p.angle, .pi/4)
        
        let onXAxisP = CGPoint(x:1, y:0)
        XCTAssertEqual(onXAxisP.angle, 0)
        
        let onYAxisP = CGPoint(x:0, y:1)
        XCTAssertEqual(onYAxisP.angle, .pi/2)
        
        let onNegativeXAxisP = CGPoint(x:-1, y:0)
        XCTAssertEqual(onNegativeXAxisP.angle, .pi)
    }
    
    func testDotProduct() {
        let p = CGPoint(x:1, y:2)
        let q = CGPoint(x:3, y:4)
        
        XCTAssertEqual(CGPoint.dotProduct(this: p, that: q), 11)
        
        let zero = CGPoint(x:0, y:0)
        
        XCTAssertEqual(CGPoint.dotProduct(this: p, that: zero), 0)
    }
}

#endif
