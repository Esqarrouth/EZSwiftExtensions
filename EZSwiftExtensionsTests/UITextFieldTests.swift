//
//  UITextFieldTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UITextFieldTests: XCTestCase {
    
    let x: CGFloat = 30
    let y: CGFloat = 35
    let width: CGFloat = 40
    let height: CGFloat = 45
    let testLength = 5
    
    func testFrame() {
        
        let textField = UITextField(x: x, y: y, w: width, h: height)
        let expectedFrame =  CGRect(x: x, y: y, width: width, height: height)
        
        XCTAssertEqual(textField.frame, expectedFrame)
    }
    
    func testFontSize() {
        
        let textField = UITextField(x: x, y: y, w: width, h: height, fontSize: 38)
        let expectedFontSize: CGFloat =  38
        
        XCTAssertEqual(textField.font?.pointSize, expectedFontSize)
    }
    // MARK: Validations
    func testValidateLength() {
        let textField = UITextField(x: x, y: y, w: width, h: height, fontSize: 38)
        var string = ""
        
        // empty
        textField.text = string
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .equalTo))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .greaterThan))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .greaterThanOrEqualTo))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .lessThan))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .lessThanOrEqualTo))
        
        // == testLength
        for _ in (0..<testLength) {
            string.append("a")
        }
        textField.text = string // "aaaaa" (5 chars)
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .equalTo))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .greaterThan))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .greaterThanOrEqualTo))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .lessThan))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .lessThanOrEqualTo))
        
        // == nil; will be treated as ""
        textField.text = nil
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .equalTo))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .greaterThan))
        XCTAssertFalse(textField.validateLength(ofCount: testLength, option: .greaterThanOrEqualTo))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .lessThan))
        XCTAssertTrue(textField.validateLength(ofCount: testLength, option: .lessThanOrEqualTo))
    }
    
    func testValidateEmail() {
        let textField = UITextField(x: x, y: y, w: width, h: height, fontSize: 38)
        
        // empty
        textField.text = ""
        XCTAssertFalse(textField.validateEmail())
        
        // valid format
        textField.text = "lol@lol.lol"
        let acceptableSpecialChars = "!#$%&'*+-/=?^_`{|}~"
        XCTAssertTrue(textField.validateEmail())
        for specialChar in acceptableSpecialChars {
            textField.text = "lol\(specialChar)lol@lol.lol"
            XCTAssertTrue(textField.validateEmail())
            textField.text = "\(specialChar)lol@lol.lol"
            XCTAssertTrue(textField.validateEmail())
            textField.text = "\(specialChar)@lol.lol"
            XCTAssertTrue(textField.validateEmail())
            textField.text = "lol\(specialChar)@lol.lol"
            XCTAssertTrue(textField.validateEmail())
            for anotherSpecialChar in acceptableSpecialChars {
                textField.text = "lol\(anotherSpecialChar)\(anotherSpecialChar)lol@lol.lol"
                XCTAssertTrue(textField.validateEmail())
                textField.text = "\(anotherSpecialChar)lol\(anotherSpecialChar)@lol.lol"
                XCTAssertTrue(textField.validateEmail())
                textField.text = "\(anotherSpecialChar)\(anotherSpecialChar)@lol.lol"
                XCTAssertTrue(textField.validateEmail())
                textField.text = "lol\(anotherSpecialChar)lol\(specialChar)@lol.lol"
                XCTAssertTrue(textField.validateEmail())
            }
        }
        textField.text = "lol.lol@lol.lol"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "lol@lol.l"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "1lol@lol.lol"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "lol1@lol.lol"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "lol@lol.lol1"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "lol@1.lol"
        XCTAssertTrue(textField.validateEmail())
        textField.text = "lol@1.1"
        XCTAssertTrue(textField.validateEmail())
        
        // invalid formats
        textField.text = "lol.lol.lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "lol@lol."
        XCTAssertFalse(textField.validateEmail())
        textField.text = "lol@lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "lol@"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "@"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "@lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "@lol."
        XCTAssertFalse(textField.validateEmail())
        textField.text = "@lol.lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = "@lol.lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = ".@lol.lol"
        XCTAssertFalse(textField.validateEmail())
        textField.text = ".lol@lol.lol"
        XCTAssertFalse(textField.validateEmail())
    }
    
    func testValidateDigits() {
        let textField = UITextField(x: x, y: y, w: width, h: height, fontSize: 38)
        
        // digits
        textField.text = "123"
        XCTAssertTrue(textField.validateDigits())
        textField.text = "1"
        XCTAssertTrue(textField.validateDigits())
        
        // alphabets
        textField.text = "l"
        XCTAssertFalse(textField.validateDigits())
        textField.text = "lol"
        XCTAssertFalse(textField.validateDigits())
        
        // alphanumerics
        textField.text = "lol123"
        XCTAssertFalse(textField.validateDigits())
        textField.text = "123lol"
        XCTAssertFalse(textField.validateDigits())
        textField.text = "1l2o3l"
        XCTAssertFalse(textField.validateDigits())
    }
}

#endif
