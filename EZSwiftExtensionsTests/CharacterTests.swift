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
    
    let pchr: Character = "p”
    let digitChr: Character = “3”
    
    let int: Int = 3
    let str: String = "p"

    override func setUp() {
        super.setUp()
    }
    
    func testToString() {
        
        
        XCTAssertEqual(chr.toString, str)
    }
    
    func testToInt() {
        
        XCTAssertEqual(chr.toInt, int)
        XCTAssertEqual(pchr.toInt, nil)
    }
}
