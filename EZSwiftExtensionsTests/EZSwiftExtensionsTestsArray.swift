//
//  EZArrayExtensionsTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class EZSwiftExtensionsTestsArray: XCTestCase {
  
    var numberArray: [Int] = []
  
    override func setUp() {
        super.setUp()
        numberArray = [Int](0...20)
    }

    func testIndexOf() {
        XCTAssertEqual(numberArray.indexOf(10), numberArray.indexOfObject(10))
    }
  
    func testRemoveObject() {
        var copy = numberArray
        copy.removeAtIndex(0)
        numberArray.removeObject(0)
        XCTAssertEqual(copy, numberArray)
    }
  
    func testContainsInstanceOf() {
        XCTAssertFalse(numberArray.containsInstanceOf("a"))
        XCTAssertFalse(numberArray.containsInstanceOf(12.22))
        XCTAssertTrue(numberArray.containsInstanceOf(46378))
    }
  
    func testContainsArray() {
        let array = [Int](2...6)
        XCTAssertTrue(numberArray.containsArray(array))
    }
  
}