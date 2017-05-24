//
//  UIEdgeInsetsTests.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2017/01/19.
//  Copyright © 2017年 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIEdgeInsetsTests: XCTestCase {
    func testInit() {
        let insets = UIEdgeInsets(inset: 10)
        XCTAssertEqual(insets.top, 10)
        XCTAssertEqual(insets.left, 10)
        XCTAssertEqual(insets.bottom, 10)
        XCTAssertEqual(insets.right, 10)
    }
}
