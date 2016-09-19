//
//  EZSwiftFunctionsTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class EZSwiftFunctionsTests: XCTestCase {
   
    func testIterateEnum() {
        enum testEnum: Int {
            case one = 1
            case two = 2
            case three = 3
            case four = 4
        }
        var totalValue = 0
        var totalLoopCount = 0
        for e in ez.iterateEnum(testEnum.self) {
            totalValue += e.rawValue
            totalLoopCount += 1
        }
        XCTAssertEqual(totalValue, 10)
        XCTAssertEqual(totalLoopCount, 4)

    }
    
}
