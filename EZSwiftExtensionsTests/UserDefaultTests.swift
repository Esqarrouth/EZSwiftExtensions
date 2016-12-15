//
//  UserDefaultTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UserDefaultTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSubscript() {
        let testUserDefaults = UserDefaults(suiteName: "TEST")
        testUserDefaults?.set("bar", forKey: "foo")
        XCTAssertEqual(testUserDefaults?["foo"] as! String, "bar")
        XCTAssertNil(testUserDefaults?["wrongkey"])
    }
}

