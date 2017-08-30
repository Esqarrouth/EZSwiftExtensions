//
//  UILabelTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions
class UILabelTests: XCTestCase {

    func testInit() {
        
        let label = UILabel(x: 0, y: 0, w: 200, h: 50)
        let expected = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let label2 = UILabel(x: 0, y: 0, w: 200, h: 50, fontSize: 20)
        
        let label3 = UILabel(font: UIFont.systemFont(ofSize: 32), color: .red, alignment: .left)
        
        XCTAssertEqual(label.frame, expected.frame)
        XCTAssertEqual(label2.font.pointSize, 20)
        XCTAssertEqual(label.font.pointSize, 17)
        
        XCTAssertEqual(label3.font, UIFont.systemFont(ofSize: 32))
        XCTAssertEqual(label3.textColor, .red)
        XCTAssertEqual(label3.textAlignment, .left)
    }
    
    func testSet() {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.set(text: "EZSwiftExtensions✅", duration: 1)
        XCTAssertEqual(label.text, "EZSwiftExtensions✅")
        
        label.text = ""
        label.set(text: "EZSwiftExtensions🚀", duration: 0)
        XCTAssertEqual(label.text, "EZSwiftExtensions🚀")
        
        label.text = ""
        label.set(text: "EZSwiftExtensions❤️", duration: 1)
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

#endif
