//
//  UIButtonTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UIButtonTests: XCTestCase {

    func testFrameInit() {
    
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = 100
        let h: CGFloat = 100
        let button = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        let button2 = UIButton(x: x, y: y, w: w, h: h, target: self, action: #selector(selectorTest))
        XCTAssertEqual(button.frame, button2.frame)
    }

    func selectorTest() {
        
    }
}

#endif
