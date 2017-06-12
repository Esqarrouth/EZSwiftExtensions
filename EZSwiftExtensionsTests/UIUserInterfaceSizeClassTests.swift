//
//  UIUserInterfaceSizeClassTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest

@testable import EZSwiftExtensions

class UIUserInterfaceSizeClassTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStringValue() {
        let compact = UIUserInterfaceSizeClass(rawValue: 1)
        XCTAssertEqual(compact?.stringValue, "Compact")
        
        let regular = UIUserInterfaceSizeClass(rawValue: 2)
        XCTAssertEqual(regular?.stringValue, "Regular")
        
        let unspecified = UIUserInterfaceSizeClass(rawValue: 999)
        XCTAssertEqual(unspecified?.stringValue, "Unspecified")
    }
}

#endif
