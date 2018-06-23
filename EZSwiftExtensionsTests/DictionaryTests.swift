//
//  DictionaryTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

class DictionaryTests: XCTestCase {
    var firstdic: [String:Int]!
    var secondDic: [String:Int]!
    var thirdDic: [String:Int]!
    var fourthDic: [String:Int]!

    override func setUp() {
        super.setUp()
        firstdic = ["one" : 1, "two" : 2, "three" : 3]
        secondDic = ["four" : 4, "five" : 5]
        thirdDic = ["six" : 6, "seven" : 7]
        fourthDic = ["two" : 2, "three" : 3, "five" : 5, "six" : 6]
    }

    func testUnion() {
        let union = firstdic.union(secondDic)
        XCTAssertEqual(firstdic.keys.count + secondDic.keys.count, union.keys.count)
        XCTAssertEqual(firstdic.values.count + secondDic.values.count, union.values.count)

        let multiUnion = firstdic | secondDic | thirdDic
        XCTAssertEqual(firstdic.keys.count + secondDic.keys.count + thirdDic.keys.count, multiUnion.keys.count)
        XCTAssertEqual(firstdic.values.count + secondDic.values.count + thirdDic.values.count, multiUnion.values.count)
    }

    func testIntersection() {
        let union = firstdic | secondDic
        let intersection = union & fourthDic

        XCTAssertTrue(intersection.has("two"))
        XCTAssertTrue(intersection.has("three"))
        XCTAssertTrue(intersection.has("five"))
        XCTAssertEqual(intersection.count, 3)
    }

    func testDifference() {
        let union = firstdic | secondDic
        let difference = union - fourthDic

        XCTAssertTrue(difference.has("one"))
        XCTAssertTrue(difference.has("four"))
        XCTAssertEqual(difference.count, 2)
    }

    func testTestAll() {
        let allKeysHaveMoreThan3Chars = firstdic.testAll { key, _ in key.length >= 3 }
        XCTAssertTrue(allKeysHaveMoreThan3Chars)
    }

    func testToArray() {
        let array = fourthDic.toArray { key, value in
            return key.uppercased() + String(value)
        }

        XCTAssertNotNil(array.index(of: "TWO2"))
        XCTAssertNotNil(array.index(of: "FIVE5"))
        XCTAssertEqual(array.count, fourthDic.count)
    }

    func testMapFilterValues() {
        let thirdMappedDic = thirdDic.mapFilterValues { (key, value) -> String? in
            if value == 6 {
                return nil
            } else {
                return "\(key) * 2 = \(value * 2)"
            }
        }

        XCTAssertEqual(thirdMappedDic.count, 1)
        XCTAssertTrue(thirdMappedDic.has("seven"))
        XCTAssertEqual(thirdMappedDic["seven"], "seven * 2 = 14")
    }

    func testDicToJSON() {
        let dic: Dictionary = ["foo":"bar"]
        let json = dic.formatJSON()
        let str = "{\"foo\":\"bar\"}"
        XCTAssertEqual(json, str)
    }
    
    func testJSONtoDic() {
        let str = "{\"foo\":\"bar\"}"
        let dic = Dictionary<String, String>.constructFromJSON(json: str)
        let dicExpected: Dictionary = ["foo":"bar"]
        XCTAssertEqual(dic!, dicExpected)
        
        let badStr = "BADSTR"
        let badDic = Dictionary<String, String>.constructFromJSON(json: badStr)
        XCTAssertNil(badDic)
    }
    
    func testRandomOnEmptyDict() {
        XCTAssertNil([:].random())
    }
    
    func testRandom() {
        let singleEntryDictionary = ["one": 1]
        (1...10).forEach { _ in
            XCTAssertEqual(singleEntryDictionary.random(), Optional<Int>.some(1))
        }
        // non-deterministic value return, but deterministic optional case ('.some(_)')
        (1...10).forEach { _ in
            XCTAssertNotNil(firstdic.random())
        }
    }
}
