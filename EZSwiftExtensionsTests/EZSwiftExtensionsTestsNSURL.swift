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

    func testRemote() {
        var len: Int64?
        var support: Bool?
        let urlResume = NSURL(string: "http://httpbin.org/range/1024")!
        let urlSize = NSURL(string: "http://httpbin.org/bytes/1024")!
        let group = dispatch_group_create()
        dispatch_group_enter(group)
        urlSize.remoteSize({ (contentLength: Int64) in
            len = contentLength
            dispatch_group_leave(group)
        })
        dispatch_group_enter(group)
        urlResume.supportsResume({ (doesSupport: Bool) in
            support = doesSupport
            dispatch_group_leave(group)
        })
        dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, Int64(30 * NSEC_PER_SEC)))
        XCTAssertEqual(len, 1024)
        XCTAssertEqual(support, true)
    }
    
    func testIsSame() {
        let url1 = NSURL(string: "http://google.com/")!
        let url2 = NSURL(string: "http://www.google.com")!
        XCTAssertTrue(url1.isSameWithURL(url2))
    }
    
    func testFileFunctions() {
        // FIXME: Better implementation to address a real existing file url
        let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let documentsURL = NSURL(fileURLWithPath: documentsPath)
        XCTAssertTrue(documentsURL.fileIsDirectory)
        XCTAssertNotNil(documentsURL.fileCreationDate)
        XCTAssertNotNil(documentsURL.fileModifiedDate)
        XCTAssertTrue(documentsURL.fileIsWritable)
        XCTAssertEqual(documentsURL.fileSize, -1)
    }
    
    
}
