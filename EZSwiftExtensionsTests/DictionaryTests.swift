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

    func testFilter() {
        let secondFiltered = secondDic.filter { key, value in key != "five" }

        XCTAssertTrue(secondFiltered.has("four"))
        XCTAssertEqual(secondFiltered.count, 1)

    }

    func testJSON () {
        let jsonDic = NSDictionary(dictionary: ["name": "John", "surname": "Smith", "age": 35.0, "married": NSNumber(value: true as Bool), "children": 3])
        let jsonString = jsonDic.formatJSON()
        XCTAssertNotNil(jsonString)
        let secondJsonDic = NSDictionary(json: jsonString!)
        XCTAssertEqual(secondJsonDic!["name"] as? String, "John")
        XCTAssertEqual(secondJsonDic!["age"] as? Double, 35.0)
        XCTAssertEqual(secondJsonDic!["married"] as? Bool, true)
        XCTAssertEqual(secondJsonDic!["children"] as? Int, 3)
    }
}
