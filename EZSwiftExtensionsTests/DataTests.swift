//
//  DataTests.swift
//  EZSwiftExtensions
//
//  Created by Sanyal, Arunav on 2/12/17.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

class DataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNSAttributedStringSanityTest() {
       let data = Data()
       XCTAssertEqual(data.attributedString, NSAttributedString())
    }
    
    func testNSAttributedStringTest() {
        
        // We can alternatively store the existing google.com contents on a file
        // to stabilize this test case.
        let url =  URL(string:"http://www.google.com")
        do {
            let data = try Data(contentsOf: url!)
            XCTAssertEqual(data.attributedString?.length, 217)
            
            // TODO : Write additional tests on attrs, e.g. the font family
        } catch _ {
            XCTFail()
        }
    }
}
