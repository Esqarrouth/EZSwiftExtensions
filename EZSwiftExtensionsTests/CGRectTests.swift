//
//  CGRectTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class CGRectTests: XCTestCase {

    func testInit() {
        let cg = CGRect(x: 55, y: 66, w: 77, h: 88)
        XCTAssertEqual(cg.origin.x, 55)
        XCTAssertEqual(cg.origin.y, 66)
        XCTAssertEqual(cg.width, 77)
        XCTAssertEqual(cg.height, 88)
    }
    
    func testSetXYWH() {
        var cg = CGRect(x: 55, y: 66, width: 77, height: 88)
        cg.x = 111
        cg.y = 112
        cg.w = 113
        cg.h = 114
        XCTAssertEqual(cg.origin.x, 111)
        XCTAssertEqual(cg.origin.y, 112)
        XCTAssertEqual(cg.width, 113)
        XCTAssertEqual(cg.height, 114)
    }
    
    func testGetXYWH() {
        var cg = CGRect(x: 55, y: 66, width: 77, height: 88)
        XCTAssertEqual(cg.x, 55)
        XCTAssertEqual(cg.y, 66)
        XCTAssertEqual(cg.w, 77)
        XCTAssertEqual(cg.h, 88)
    }

}
