//
//  UISwitchTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

@testable import EZSwiftExtensions

class UISwitchTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    #if os(iOS)
    
    func testToggle() {
        let testUISwitch = UISwitch()
        
        XCTAssertFalse(testUISwitch.isOn)
        testUISwitch.toggle()
        XCTAssertTrue(testUISwitch.isOn)
        testUISwitch.toggle()
        XCTAssertFalse(testUISwitch.isOn)
    }
    
    #endif
    

}

