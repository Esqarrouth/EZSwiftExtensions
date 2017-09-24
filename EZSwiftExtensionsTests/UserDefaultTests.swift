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
    
    func testDate() {
        let testUserDefaults = UserDefaults(suiteName: "TEST")
        let key = "dateTestKey"
        let date = Date()
        testUserDefaults?.set(date, forKey: key)
        XCTAssertNotNil(testUserDefaults?.date(forKey: key))
        XCTAssertEqual(testUserDefaults?.date(forKey: key)!, date)
        
        XCTAssertNil(testUserDefaults?.date(forKey: "WRONGKEY"))
        
        let keyWithoutDate = "FOO"
        testUserDefaults?.set("BAR", forKey: keyWithoutDate)
        XCTAssertNil(testUserDefaults?.date(forKey: keyWithoutDate))
    }
}

