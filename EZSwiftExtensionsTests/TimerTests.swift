//
//  TimerTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class TimerTests: XCTestCase {
    
    public func testAfterDelayPositiveCase() {
        
        let testAfterDelayExpectation = expectation(description: "testAfterDelay")
        
        var methodCalled = false

        Timer.runThisAfterDelay(seconds: 1) { () -> () in
            methodCalled = true
            testAfterDelayExpectation.fulfill()
        }

        self.waitForExpectations(timeout: 5) { completion in
            XCTAssertTrue(methodCalled)
        }
    }
}

