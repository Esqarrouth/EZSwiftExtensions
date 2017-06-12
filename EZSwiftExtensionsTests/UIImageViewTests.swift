//
//  UIImageViewTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest

class UIImageViewTests: XCTestCase {
    
    // Tests the UIImageView constructor derived from UIView
    public func testUIImageViewConvenienceInit() {
        let view = UIImageView(x: 10, y: 20, w: 60, h: 50)
        XCTAssertEqual(view.frame.area, 3000)
        XCTAssertEqual(view.frame.x, 10)
        XCTAssertEqual(view.frame.y, 20)
    }
}

#endif
