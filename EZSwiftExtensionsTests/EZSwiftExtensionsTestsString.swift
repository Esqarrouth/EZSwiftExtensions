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
        XCTAssertEqual(String(10.253, precision: 2), "10.25")
        XCTAssertEqual(String(10.257, precision: 2), "10.26")
        XCTAssertTrue(string.toNSString.isKindOfClass(NSString.self))
    }

    func testIsIncludeEmoji() {
        string = "Incididunt tempor ad 😃 sint Lorem amet 🍷 Elit ut dolore ad est qui magna 🍻"
        XCTAssertTrue(string.includesEmoji())

        string = "The greatest respect that writers can give their readers is to not write anything that they expect"
        XCTAssertFalse(string.includesEmoji())
    }
    
    func testBase64Conversion() {
        let string = "EZSwiftExtensions is Awesome"
        let base64String = "RVpTd2lmdEV4dGVuc2lvbnMgaXMgQXdlc29tZQ"
        let base64StringPadded = "RVpTd2lmdEV4dGVuc2lvbnMgaXMgQXdlc29tZQ=="
        XCTAssertEqual(string.base64, base64StringPadded)
        let newString = String(base64: base64String) ?? ""
        XCTAssertEqual(newString, string)
    }
    
    func testStatsFuncs() {
        let string = "EZSwiftExtensions is Awesome, let's revolutionize Swift\nI love it.\n"
        XCTAssertEqual(string.countofWords, 10)
        XCTAssertEqual(string.countofParagraphs, 2)
        XCTAssertEqual(string.positionOfSubstring("Awesome"), 21)
        XCTAssertEqual(string.split(" ")[3], "let's")
        switch string {
        case hasPrefix("EZSwift"):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
        switch string {
        case hasSuffix(" it.\n"):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
}
