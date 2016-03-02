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
        //[0, 1, 2, 3, 4, 5, 1]
        numberArray = [Int](0...5)
        numberArray.append(1)
    }
    
    func testIndexesOf() {
        var indexes = numberArray.indexesOf(1)
        XCTAssertEqual(indexes, [1, 6])
        
        indexes = numberArray.indexesOf(12345)
        XCTAssertEqual(indexes, [])
    }
  
    func testRemoveObject() {
        let copyArray = numberArray
        numberArray.removeObject(12345)
        XCTAssertEqual(numberArray, copyArray)
        
        let compareArray = [0, 2, 3, 4, 5, 1]
        numberArray.removeObject(1)
        XCTAssertEqual(numberArray, compareArray)
    }
    
    func testRemoveObjects() {
        let copyArray = numberArray
        numberArray.removeObjects(12345)
        XCTAssertEqual(numberArray, copyArray)
        
        let compareArray = [0, 2, 3, 4, 5]
        numberArray.removeObjects(1)
        XCTAssertEqual(numberArray, compareArray)
    }
  
    func testContainsInstanceOf() {
        XCTAssertFalse(numberArray.containsInstanceOf("a"))
        XCTAssertFalse(numberArray.containsInstanceOf(12.22))
        XCTAssertTrue(numberArray.containsInstanceOf(46378))
    }
  
    func testContainsArray() {
        let array = [Int](2...4)
        XCTAssertTrue(numberArray.containsArray(array))
    }
  
}