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
    
    let pchr: Character = "p"
    let pchrUpper: Character = "P"
    let digitChr: Character = "3"
    
    let int: Int = 3
    let str: String = "p"

    override func setUp() {
        super.setUp()
    }
    
    func testToString() {
        XCTAssertEqual(pchr.toString, str)
    }
    
    func testToInt() {
        XCTAssertEqual(digitChr.toInt, int)
        XCTAssertEqual(pchr.toInt, nil)
    }
    
    func testUppercased() {
        XCTAssertEqual(pchr.uppercased, pchrUpper)
        XCTAssertEqual(digitChr.uppercased, digitChr)
    }
    
    func testLowercased() {
        XCTAssertEqual(pchrUpper.lowercased, pchr)
        XCTAssertEqual(digitChr.lowercased, digitChr)
    }
    
    func testIsIncludeEmoji() {
        let emojiChar:Character = "😃"
        XCTAssertTrue(emojiChar.isEmoji)
        XCTAssertFalse(digitChr.isEmoji)
        XCTAssertFalse(pchr.isEmoji)
    }
}
