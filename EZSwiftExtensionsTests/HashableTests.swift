//
//  HashableTests.swift
//  EZSwiftExtensions
//
//  Created by Rugen Heidbuchel on 01/08/2018.
//  Copyright © 2018 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class HashableTests: XCTestCase {
    
    func testHashString() {
        let s = "test"
        XCTAssertEqual(s.hashString, String(s.hashValue))
    }
    
}
