//
//  UILabelTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions
class UILabelTests: XCTestCase {

    func testInit() {
        
        let label = UILabel(x: 0, y: 0, w: 200, h: 50)
        let expected = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let label2 = UILabel(x: 0, y: 0, w: 200, h: 50, fontSize: 20)
        
        XCTAssertEqual(label.frame, expected.frame)
        XCTAssertEqual(label2.font.pointSize, 20)
    }
    
    func testText() {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.setText("EZSwiftExtensions✅", animated: false, duration: nil)
        XCTAssertEqual(label.text, "EZSwiftExtensions✅")
        
        label.text = ""
        label.setText("EZSwiftExtensions🚀", animated: true, duration: 5)
        XCTAssertEqual(label.text, "EZSwiftExtensions🚀")
        
        label.text = ""
        label.setText("EZSwiftExtensions❤️", animated: true, duration: nil)
        XCTAssertEqual(label.text, "EZSwiftExtensions❤️")
    }

    var waitExpectation: XCTestExpectation?
    
    func wait(duration: TimeInterval) {
        waitExpectation = expectation(description: "wait")
        Timer.scheduledTimer(timeInterval: duration, target: self,
                                               selector: #selector(UILabelTests.onTimer), userInfo: nil, repeats: false)
        waitForExpectations(timeout: duration + 3, handler: nil)
    }
    
    func onTimer() {
        waitExpectation?.fulfill()
    }
}

