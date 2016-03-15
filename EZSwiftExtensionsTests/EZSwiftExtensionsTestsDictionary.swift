//
//  EZSwiftExtensionsTestsDictionary.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class EZSwiftExtensionsTestsDictionary: XCTestCase {
  
    var dic: [String:Int]!
    var secondDic: [String:Int]!
    var thirdDic: [String:Int]!

  
    override func setUp() {
        super.setUp()
        dic = ["one" : 1, "two" : 2, "three" : 3]
        secondDic = ["four" : 4, "five" : 5]
        thirdDic = ["six" : 6, "seven" : 7]
    }
  
    func testUnion() {
        let union = dic.union(secondDic)
        XCTAssertEqual(Array(dic.keys).count + Array(secondDic.keys).count, Array(union.keys).count)
        XCTAssertEqual(Array(dic.values).count + Array(secondDic.values).count, Array(union.values).count)
        let multiUnion = dic.union(secondDic, thirdDic)
        XCTAssertEqual(Array(dic.keys).count + Array(secondDic.keys).count + Array(thirdDic.keys).count, Array(multiUnion.keys).count)
        XCTAssertEqual(Array(dic.values).count + Array(secondDic.values).count + Array(thirdDic.values).count, Array(multiUnion.values).count)
    }
  
}
