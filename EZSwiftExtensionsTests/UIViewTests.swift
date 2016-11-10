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

    let translation = CGFloat(20)

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func view() -> UIView {
        return UIView(x: 0, y: 0, w: 200, h: 50)
    }
    
    func testSetTranslation() {
        
        let view = self.view()
        let aView = UIView(frame:view.frame)
        view.addSubview(aView)
        
        let oldOrigin:CGPoint = CGPoint(x: aView.frame.minX, y:aView.frame.minY)
        
        aView.setTranslation(duration: 1, x: 0, y: translation, completion: nil)
        
        let newOrigin = CGPoint(x: aView.frame.minX, y:aView.frame.minY)
        
        XCTAssertEqual(oldOrigin.y + translation, newOrigin.y)

    }
    
    func testBackToOrigin() {
        
        let view = self.view()
        let aView = UIView(frame:view.frame)
        view.addSubview(aView)
        
        let oldOrigin:CGPoint = CGPoint(x: aView.frame.minX, y:aView.frame.minY)
        
        aView.setTranslation(duration: 1, x: translation, y: translation, completion: nil)
        aView.backToOrigin()
    
        XCTAssertEqual(oldOrigin.y, aView.frame.minY)
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

