//
//  UIDeviceTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIDeviceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetDocumentsDirectoryPath() {
        
        let paths           = NSURL(fileURLWithPath: UIDevice.documentsDirectoryPath())
        let getImagePath    = paths.appendingPathComponent("testFile.jpg")
        let checkValidation = FileManager.default
        
        if checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!) == true {
            XCTAssert(checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!))
        }
    }
    
    func testGetCachesDirectoryPath() {
        
        let paths           = NSURL(fileURLWithPath: UIDevice.cachesDirectoryPath())
        let getImagePath    = paths.appendingPathComponent("testCache.jpg")
        let checkValidation = FileManager.default
        
        if checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!) == true {
            XCTAssert(checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!))
        }
    }
    
}

