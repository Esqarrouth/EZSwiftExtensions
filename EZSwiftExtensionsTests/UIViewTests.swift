//
//  UIViewTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

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
    
    func testRoundView() {
        let wideView = UIView(x: 0, y: 0, w: 200, h: 80)
        XCTAssertEqual(wideView.layer.cornerRadius, 0)
        XCTAssertEqual(wideView.layer.borderWidth, 0)
        XCTAssertNotEqual(wideView.layer.borderColor, UIColor.clear.cgColor)
        
        wideView.roundView()
        XCTAssertEqual(wideView.layer.cornerRadius, CGFloat(40.0))
        XCTAssertEqual(wideView.layer.borderWidth, 0)
        XCTAssertEqual(wideView.layer.borderColor, UIColor.clear.cgColor)
        
        let tallView = UIView(x: 0, y: 0, w: 30, h: 300)
        XCTAssertEqual(tallView.layer.cornerRadius, 0)
        XCTAssertEqual(tallView.layer.borderWidth, 0)
        XCTAssertNotEqual(tallView.layer.borderColor, UIColor.clear.cgColor)
        
        tallView.roundView()
        XCTAssertEqual(tallView.layer.cornerRadius, CGFloat(15.0))
        XCTAssertEqual(tallView.layer.borderWidth, 0)
        XCTAssertEqual(tallView.layer.borderColor, UIColor.clear.cgColor)
    }
    
    func testRoundViewWithBorderAndColor() {
        let view = UIView(x: 0, y: 0, w: 100, h: 100)
        let color = UIColor.blue
        let borderWidth: CGFloat = 5.0

        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.borderWidth, 0)
        XCTAssertNotEqual(view.layer.borderColor, color.cgColor)
        
        view.roundView(withBorderColor: color, withBorderWidth: borderWidth)
        XCTAssertEqual(view.layer.cornerRadius, CGFloat(50.0))
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
        XCTAssertEqual(view.layer.borderColor, color.cgColor)
    }
    
    func testNakedView() {
        let view = UIView(x: 0, y: 0, w: 100, h: 100)
        let color = UIColor.blue
        let borderWidth: CGFloat = 5.0
        
        view.roundView(withBorderColor: color, withBorderWidth: borderWidth)
        XCTAssertEqual(view.layer.cornerRadius, CGFloat(50.0))
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
        
        view.nakedView()
        XCTAssertEqual(view.layer.cornerRadius, CGFloat(50.0))
        XCTAssertEqual(view.layer.borderWidth, 0)
    }
}

#endif

