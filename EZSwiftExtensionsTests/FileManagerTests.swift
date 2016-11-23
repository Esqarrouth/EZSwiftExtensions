//
//  FileManagerTests.swift
//  EZSwiftExtensions
//
//  Created by albert vila on 16/11/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class FileManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetDocumentsDirectoryPath() {
        
        let paths           = NSURL(fileURLWithPath: FileManager().documentsDirectoryPath)
        let getImagePath    = paths.appendingPathComponent("testFile.jpg")
        let checkValidation = FileManager.default
   
        if checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!) == true {
            XCTAssert(checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!))
        }
    }
    
    func testGetCachesDirectoryPath() {

        let paths           = NSURL(fileURLWithPath: FileManager().cachesDirectoryPath)
        let getImagePath    = paths.appendingPathComponent("testCache.jpg")
        let checkValidation = FileManager.default

        if checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!) == true {
            XCTAssert(checkValidation.fileExists(atPath: (getImagePath?.absoluteString)!))
        }
    }
    
}
