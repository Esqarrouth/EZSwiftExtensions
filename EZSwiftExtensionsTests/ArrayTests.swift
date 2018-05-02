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
    let emptyArray = [Int]()
    var numberArray = [Int]()

    override func setUp() {
        super.setUp()
        //[0, 1, 2, 3, 4, 5, 1]
        numberArray = [Int](0...5)
        numberArray.append(1)
    }
    
    func testGet_SubArray() {
        XCTAssertEqual(numberArray.get(at: 2...4), [2,3,4])
        XCTAssertEqual(numberArray.get(at: -1...8), [0,1,2,3,4,5,1])
        XCTAssertEqual(numberArray.get(at: -1...3), [0,1,2,3])
        XCTAssertEqual(numberArray.get(at: 4...8), [4,5,1])
        
        let emptyArray = [Int]()
        XCTAssertEqual(emptyArray.get(at: 0...0), [])
        XCTAssertEqual(emptyArray.get(at: 1...3), [])
        XCTAssertEqual(emptyArray.get(at: -3...(-1)), [])
        XCTAssertEqual(emptyArray.get(at: -1...1), [])
    }
    
    func testSafeIndex() {
        
        let optionalNumber: Int? = 3
        XCTAssertEqual(numberArray[safe: 3], optionalNumber)
        XCTAssertNotEqual(numberArray[safe: 4], 3)
        XCTAssertNil(numberArray[safe: 10])
    }

    func testAdding() {
        numberArray.insertFirst(9)
        XCTAssertEqual(numberArray[0], 9)

        var nullableNumberArray: [Int?] = numberArray
        nullableNumberArray.insertFirst(nil)
        XCTAssertNil(nullableNumberArray[0])
        XCTAssertEqual(nullableNumberArray[1], 9)
    }

    func testIndexesOf() {
        var indexes = numberArray.indexes(of: 1)
        XCTAssertEqual(indexes, [1, 6])

        indexes = numberArray.indexes(of: 12345)
        XCTAssertEqual(indexes, [])
    }

    func testLastIndexOf() {
        XCTAssertEqual(numberArray.lastIndex(of: 1), 6)
        XCTAssertNil(numberArray.lastIndex(of: -1))
        XCTAssertEqual(numberArray.lastIndex(of: 0), 0)

    }

    func testRemoveObject() {
        let copyArray = numberArray
        numberArray.removeFirst(12345)
        XCTAssertEqual(numberArray, copyArray)

        let compareArray = [0, 2, 3, 4, 5, 1]
        numberArray.removeFirst(1)
        XCTAssertEqual(numberArray, compareArray)
    }

    struct NonHashable : Equatable {
        let val: Int
        init(_ val: Int) { self.val = val }
        
        static func ==(lhs: NonHashable, rhs: NonHashable) -> Bool {
            return lhs.val == rhs.val
        }
    }
    
    func testRemoveAllSanityFromStdLib() {
        var rmArray = [1, 2, 3, 4, 5]
        
        // This test case is to ensure that remove all from std lib is not conflicted.
        // The method called here is from std lib. If there is a compile time failure, 
        // our code is coflicting with stdlib.
        rmArray.removeAll()
        
        XCTAssertTrue(rmArray.isEmpty)
    }

    func testRemoveObjectsByArray() {
        let removeArrayA = [123, 45] // none present in target
        let removeArrayB = [1, 3]    // both present in target

        // 'removeAll' overload for Hashable elements
        let copyArray = numberArray
        numberArray.removeAll(removeArrayA)
        XCTAssertEqual(numberArray, copyArray)

        let compareArray = [0, 2, 4, 5]
        numberArray.removeAll(removeArrayB)
        XCTAssertEqual(numberArray, compareArray)

        // 'removeAll' overload for Equatable but not Hashable elements
        var nonHashableArray = numberArray.map(NonHashable.init)
        let nonHashableCopyArray = nonHashableArray
        nonHashableArray.removeAll(removeArrayA.map(NonHashable.init))
        XCTAssertEqual(nonHashableArray, nonHashableCopyArray)

        let nonHashableCompareArray = compareArray.map(NonHashable.init)
        nonHashableArray.removeAll(removeArrayB.map(NonHashable.init))
        XCTAssertEqual(nonHashableArray, nonHashableCompareArray)
    }

    func testRemoveObjectsByVariadic() {
        let copyArray = numberArray
        numberArray.removeAll(12345)
        XCTAssertEqual(numberArray, copyArray)

        let compareArray = [0, 2, 4, 5]
        numberArray.removeAll(1, 3)
        XCTAssertEqual(numberArray, compareArray)
    }
    
    func testRemoveObjectByVariadicWithFirstElement() {
        var noChangeArray = [0, 2, 4, 5]
        let nilFirstElem:Int? = nil
        noChangeArray.removeAll(nilFirstElem, 1, 3)
        XCTAssertEqual(noChangeArray, noChangeArray)
        
        var changedArrayWithNilFirstElement = [0, 2, 4, 5]
        changedArrayWithNilFirstElement.removeAll(nilFirstElem, 2, 4)
        XCTAssertEqual(changedArrayWithNilFirstElement, [0, 5])
        
        var changedArray = [0, 2, 4, 5, 6]
        let firstElement = 0;
        changedArray.removeAll(firstElement, 2, 4)
        XCTAssertEqual(changedArray, [5, 6])
    }

    func testContainsInstanceOf() {
        XCTAssertFalse(numberArray.containsType(of: "a"))
        XCTAssertFalse(numberArray.containsType(of: 12.22))
        XCTAssertTrue(numberArray.containsType(of: 46378))
    }

    func testContainsArray() {
        let emptyArray = [Int]()
        let array = [Int](2...4)
        let wrongArray = [Int](4..<100)
        XCTAssertTrue(numberArray.contains(array))
        XCTAssertTrue(numberArray.contains(emptyArray))
        XCTAssertFalse(numberArray.contains(wrongArray))
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

        XCTAssertEqual(array1.testAll(is: true), true)
        XCTAssertEqual(array2.testAll(is: true), false)
        XCTAssertEqual(array2.testAll(is: false), true)
        XCTAssertEqual(array3.testAll(is: true), false)
        XCTAssertEqual(array3.testAll(is: false), false)
        XCTAssertEqual(numberArray.testAll(is: true), false)
    }

    func testGet() {
        XCTAssertNotNil(numberArray.get(at: 1))
        XCTAssertNil(numberArray.get(at: 10))
    }

    func testReverseIndex() {
        let emptyArray = [Int]()
        let array = [Int](0...5)
        XCTAssertEqual(array.reverseIndex(0), 5)
        XCTAssertEqual(array.reverseIndex(2), 3)
        XCTAssertNil(array.reverseIndex(-2))
        XCTAssertNil(array.reverseIndex(7))
        XCTAssertNil(emptyArray.reverseIndex(0))
        XCTAssertNil(emptyArray.reverseIndex(4))
        XCTAssertNil(emptyArray.reverseIndex(-3))
    }

    func testTakeMax() {
        let takenMax2 = numberArray.takeMax(2)
        XCTAssertEqual(takenMax2.count, 2)
        for (takenElement, takenOffset) in takenMax2.enumerated() {
            XCTAssertEqual(takenElement, numberArray[takenOffset])
        }
        XCTAssertEqual(numberArray.takeMax(0).count, 0)
        XCTAssertEqual(numberArray.takeMax(-3).count, 0)

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

        emptyArray.forEachEnumerated { _,_  in XCTFail() }
        let copyArray = someArray
        copyArray.forEachEnumerated { XCTAssertTrue(someArray[$0] == $1) }
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
        let d: [Int]? = nil
        
        XCTAssertTrue(a == b)
        XCTAssertFalse(a == c)
        XCTAssertFalse(c == b)
        XCTAssertTrue(c == d)
    }

    func testShuffle() {
        let copyArray = numberArray
        var numberArray2 = numberArray
        var emptyArray = [Int]()

        var shuffledArray = numberArray.shuffled()
        XCTAssertEqual(copyArray.count, shuffledArray.count)
        for e in copyArray {
            if let i = shuffledArray.index(of: e) {
                shuffledArray.remove(at: i)
            }
        }
        XCTAssertEqual(shuffledArray.count, 0)

        numberArray2.shuffle()
        XCTAssertEqual(numberArray2.count, copyArray.count)
        for e in copyArray {
            if let i = numberArray2.index(of: e) {
                numberArray2.remove(at: i)
            }
        }
        XCTAssertEqual(numberArray2, [])

        XCTAssertEqual(emptyArray.shuffled().count, 0)
        emptyArray.shuffle()
        XCTAssertEqual(emptyArray.count, 0)
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
    
    func testUniqueElementsInArray() {
        let arrAlreadyUnique = [1, 2, 3, 4]
        XCTAssertEqual(arrAlreadyUnique.unique(), arrAlreadyUnique)
        
        let arrayAlreadyUniqueOrderMaintained = [1, 4, 3, 5]
        XCTAssertEqual(arrayAlreadyUniqueOrderMaintained.unique(), arrayAlreadyUniqueOrderMaintained)
        
        let duplicatedElementsArray = [1, 1, 2, 2, 3, 3]
        XCTAssertEqual(duplicatedElementsArray.unique(), [1, 2, 3])
        
        let duplicatedElementsArrayOrderMaintained = [2, 1, 3, 2, 1, 3]
        XCTAssertEqual(duplicatedElementsArrayOrderMaintained.unique(), [2, 1, 3])
    }
    
#if os(iOS)
    func testParallelizedMapMap() {
        let arr = [1, 2, 3, 4, 5]
        let squaredArr = arr.parallelizedMap { (x) in x * x}
        XCTAssertEqual(squaredArr.map{$0!}, [1, 4, 9, 16, 25])
        
        let doubledArr = arr.parallelizedMap { (x) in 2 * x}
        XCTAssertEqual(doubledArr.map{$0!}, [2, 4, 6, 8, 10])
    }
#endif
}
