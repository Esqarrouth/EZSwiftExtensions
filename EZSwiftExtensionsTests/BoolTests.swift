//
//  BoolTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class BoolTests: XCTestCase {
    
    func testToInt() {
        let t = true
        let f = false
        XCTAssertEqual(t.toInt, 1)
        XCTAssertEqual(f.toInt, 0)
    }

    func testToggle() {
        var value = false
        value.toggle()
        XCTAssertNotEqual(value, false)
    }
}

