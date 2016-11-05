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

    func testFrame() {
        
        let textField = UITextField(x: 30, y: 35, w: 40, h: 45)
        let expectedFrame =  CGRect(x: 30, y: 35, width: 40, height: 45)
        
        XCTAssertEqual(textField.frame, expectedFrame)
    }

    func testFontSize() {
        
        let textField = UITextField(x: 30, y: 35, w: 40, h: 45, fontSize: 38)
        let expectedFontSize: CGFloat =  38
        
        XCTAssertEqual(textField.font?.pointSize, expectedFontSize)
    }
}
