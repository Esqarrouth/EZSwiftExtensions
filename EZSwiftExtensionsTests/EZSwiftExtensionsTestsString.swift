//
//  EZSwiftExtensionsTestsString.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 29/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class EZSwiftExtensionsTestsString: XCTestCase {
  
    var string: String!

    override func setUp() {
        super.setUp()
        string = "0123456789"
    }

    func testSubscript() {
        XCTAssertEqual(string[2], "2")
        XCTAssertEqual(string[9], "9")
        XCTAssertEqual(string[0...9], "0123456789")
        XCTAssertEqual(string[3..<5], "34")
    }
  
    func testCapitalization() {
        string = "lorem ipsum"
        XCTAssertEqual(string.capitalizeFirst, "Lorem ipsum")
    }
    
    func testIsOnlyEmptySpacesAndNewLineCharacters() {
        let emptyString = " \n "
        XCTAssertFalse(string.isOnlyEmptySpacesAndNewLineCharacters())
        XCTAssertTrue(emptyString.isOnlyEmptySpacesAndNewLineCharacters())
    }
    
    func testTrim() {
        string = "space space"
        string.trim()
        XCTAssertFalse(string.containsString(" "))
    }
    
    func testIsEmail() {
        XCTAssertFalse(string.isEmail)
        string = "test@test.com"
        XCTAssertTrue(string.isEmail)
        string = "test@test"
        XCTAssertFalse(string.isEmail)
        string = "test@test."
        XCTAssertFalse(string.isEmail)
        string = "1@1.1"
        XCTAssertFalse(string.isEmail)
    }
    
    func testExtractURLs() {
        string = "http://google.com http fpt:// http://facebook.com test"
        let urls = string.extractURLs
        XCTAssertEqual(urls.count, 2)
    }
    
    func testContains() {
        XCTAssertTrue(string.contains("01"))
        XCTAssertTrue(string.contains("01", compareOption: NSStringCompareOptions.AnchoredSearch))
        XCTAssertFalse(string.contains("12", compareOption: NSStringCompareOptions.AnchoredSearch))
        XCTAssertFalse(string.contains("h"))
    }
    
    func testConversions() {
        XCTAssertNotNil(string.toInt())
        string = "0.12"//Assumed USA locale, change to "," if EU
        XCTAssertNotNil(string.toDouble())
        XCTAssertNotNil(string.toFloat())
        XCTAssertTrue(string.toNSString.isKindOfClass(NSString.self))
    }

}
