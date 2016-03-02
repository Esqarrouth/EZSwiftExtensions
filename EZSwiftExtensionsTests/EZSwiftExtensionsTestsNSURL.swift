//
//  EZSwiftExtensionsTestsNSURL.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2016/03/02.
//  Copyright © 2016年 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class EZSwiftExtensionsTestsNSURL: XCTestCase {
    func testQueryParameters() {
        let url = NSURL(string: "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=facebook")
        if let queryParameters = url?.queryParameters {
            XCTAssertEqual(queryParameters["v"], Optional("1.0"))
            XCTAssertEqual(queryParameters["q"], Optional("facebook"))
            XCTAssertEqual(queryParameters["other"], nil)
        }
    }
}
