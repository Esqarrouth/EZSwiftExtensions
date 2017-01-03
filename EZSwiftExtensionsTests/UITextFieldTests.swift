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
}
