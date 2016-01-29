//
//  EZSwiftExtensionsTestsBool.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class EZSwiftExtensionsTestsBool: XCTestCase {
  
    var bool: Bool!

    override func setUp() {
        super.setUp()
        bool = false
    }

    func testToggle() {
        let value = bool
        bool.toggle()
        XCTAssertNotEqual(value, bool)
    }

}
