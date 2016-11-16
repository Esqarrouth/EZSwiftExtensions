//
//  UIViewTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFadeIn() {
        
        let view   = UIView()
        view.alpha = 0.0
        
        view.fadeIn(0.3, delay: 1.0, completion: nil)
        XCTAssertEqual(view.alpha, 1.0)
    }

    func testFadeOut() {
        
        let view = UIView()
        
        view.fadeOut(nil, delay: nil, completion: nil)
        XCTAssertEqual(view.alpha, 0.0)
    }

    func testFadeTo() {
        
        let view = UIView()
        
        view.fadeTo(0.5)
        XCTAssertEqual(view.alpha, 0.5)
    }
    
    func testRemoveSubviews() {
        
        let view = UIView()
        let sub1 = UIView()
        let sub2 = UIView()
        let sub3 = UIView()
        
        view.addSubview(sub1)
        view.addSubview(sub2)
        view.addSubview(sub3)
        
        XCTAssertEqual(view.subviews, [sub1, sub2, sub3])

        view.removeSubviews()
        XCTAssertEqual(view.subviews.count, 0)
    }
}

