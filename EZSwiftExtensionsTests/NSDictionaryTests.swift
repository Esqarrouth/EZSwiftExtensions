//
//  NSDictionaryTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class NSDictionaryTests: XCTestCase {
    
    @available(*, deprecated: 1.8)
    func testDicToJSON() {
        let dic: NSDictionary = ["foo":"bar"]
        let json = dic.formatJSON()
        let str = "{\"foo\":\"bar\"}"
        XCTAssertEqual(json, str)
    }
    
    @available(*, deprecated: 1.8)
    func testJSONtoDic() {
        
        let str = "{\"foo\":\"bar\"}"
        let dic = NSDictionary(json: str)
        let dicExpected: NSDictionary = ["foo":"bar"]
        XCTAssertEqual(dic, dicExpected)
    }
}
