//
//  CharacterTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

@testable import EZSwiftExtensions

class CharacterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testToString() {
        
        let chr: Character = "p"
        let str: String = "p"
        XCTAssertEqual(chr.toString, str)
    }
    
    func testToInt() {
        
        let chr: Character = "3"
        let int: Int = 3
        XCTAssertEqual(chr.toInt, int)
    }
    
    func testNotInt() {
        
        let chr: Character = "p"
        XCTAssertEqual(chr.toInt, nil)
    }
}
