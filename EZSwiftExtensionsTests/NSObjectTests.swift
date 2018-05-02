//
//  NSObjectTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
import EZSwiftExtensions

class NSObjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testClassName() {
        let stringObject = "TEST_STRING"
        XCTAssertEqual(stringObject.className, "_NSContiguousString")
        
        let nsStringObject = "TEST_STRING" as NSString
        XCTAssertEqual(nsStringObject.className, "__NSCFString")
        
        let intObj = 5 as NSObject
        XCTAssertEqual(intObj.className, "__NSCFNumber")
        
        let userDefinedObject = UserDefinedClass() as NSObject
        XCTAssertEqual(userDefinedObject.className, "UserDefinedClass")
    }
    
    func testStaticClassNameTest() {
        XCTAssertEqual(NSObject.className, "NSObject")
        XCTAssertEqual(NSString.className, "NSString")
        XCTAssertEqual(UserDefinedClass.className, "UserDefinedClass")
    }
}

class UserDefinedClass : NSObject {
    
}

#endif

