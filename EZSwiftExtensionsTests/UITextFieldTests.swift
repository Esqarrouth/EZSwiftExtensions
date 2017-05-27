//
//  UITextFieldTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

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
}
