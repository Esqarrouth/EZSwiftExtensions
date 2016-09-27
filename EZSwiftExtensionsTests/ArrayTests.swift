//
//  ArrayTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

class ArrayTests: XCTestCase {
    var numberArray: [Int] = []

    override func setUp() {
        super.setUp()
        //[0, 1, 2, 3, 4, 5, 1]
        numberArray = [Int](0...5)
        numberArray.append(1)
    }

    func testIndexesOf() {
        var indexes = numberArray.indexes(of: 1)
        XCTAssertEqual(indexes, [1, 6])

        indexes = numberArray.indexes(of: 12345)
        XCTAssertEqual(indexes, [])
    }

    func testRemoveObject() {
        let copyArray = numberArray
        numberArray.removeFirstObject(12345)
        XCTAssertEqual(numberArray, copyArray)

        let compareArray = [0, 2, 3, 4, 5, 1]
        numberArray.removeFirstObject(1)
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
        XCTAssertTrue(numberArray.contains(array: array))
    }

    func testRandom() {
        XCTAssertNotNil(numberArray.random())
        XCTAssertNil([].random())
    }

    func testTestAll() {
        XCTAssertTrue(numberArray.testAll { $0 < 10 })
    }

    func testTestIfAllIs() {
        let array1 = [true, true, true]
        let array2 = [false, false]
        let array3 = [true, false]

        XCTAssertEqual(array1.testIfAllIs(true), true)
        XCTAssertEqual(array2.testIfAllIs(true), false)
        XCTAssertEqual(array2.testIfAllIs(false), true)
        XCTAssertEqual(array3.testIfAllIs(true), false)
        XCTAssertEqual(array3.testIfAllIs(false), false)
        XCTAssertEqual(numberArray.testIfAllIs(true), false)
    }

    func testGet() {
        XCTAssertNotNil(numberArray.get(1))
        XCTAssertNil(numberArray.get(10))
    }

    func testReverseIndex() {
        let array = [Int](0...5)
        XCTAssertEqual(array.reverseIndex(0), 5)
        XCTAssertEqual(array.reverseIndex(2), 3)
    }

    func testTakeMax() {
        XCTAssertEqual(numberArray.takeMax(2).count, 2)
    }

    func testForEachEnumerated() {
        let someArray = [1,2,3,4,10]
        var indexCount = 0
        var totalIndexes = 0
        var totalNumbers = 0
        someArray.forEachEnumerated { (index, element) in
            indexCount += 1
            totalIndexes += index
            totalNumbers += element
        }
        XCTAssertEqual(indexCount, 5)
        XCTAssertEqual(totalIndexes, 10)
        XCTAssertEqual(totalNumbers, 20)
    }

    func testUnion() {
        let a = [Int](0...2), b = [Int](3...5), c = [Int](6...8)
        let union = a.union(b, c)

        XCTAssertEqual(union, [Int](0...8))
    }

    func testIntersection() {
        let a = [Int](0...8), b = [Int](3...4), c = [Int](1...6)
        let intersection = a.intersection(b, c)

        XCTAssertEqual(intersection, [3, 4])
    }

    func testDifference() {
        let a = [Int](0...8), b = [Int](3...4), c = [Int](1...2)
        let difference = a.difference(b, c)

        XCTAssertEqual(difference, [0, 5, 6, 7, 8])
    }

    func testOptionalEquatable() {
        let a: [Int]? = [1, 2, 3]
        let b: [Int]? = [1, 2, 3]
        let c: [Int]? = nil
        
        XCTAssertTrue(a == b)
        XCTAssertFalse(a == c)
        XCTAssertFalse(c == b)
    }

    func testShuffle() {
        let copyArray = numberArray

        numberArray.shuffle()

        XCTAssertNotNil(numberArray)
        XCTAssertEqual(numberArray.count, copyArray.count)

        for e in copyArray {
            if let i = numberArray.index(of: e) {
                numberArray.remove(at: i)
            }
        }
        XCTAssertEqual(numberArray, [])
    }

    func testDecompose() {
        let a: [Int] = []
        let b: [Int] = [1]
        let c: [Int] = [1, 2]
        XCTAssertNil(a.decompose())
        XCTAssertTrue(b.decompose()!.head == 1 && b.decompose()!.tail == [])
        XCTAssertTrue(c.decompose()!.head == 1 && c.decompose()!.tail == [2])

        let copyArray = numberArray
        let head = copyArray.first!
        let tail = copyArray.dropFirst()
        XCTAssertTrue(numberArray.decompose()!.head == head)
        XCTAssertTrue(numberArray.decompose()!.tail == tail)
    }
}
