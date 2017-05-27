//
//  UIFontTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIFontTests: XCTestCase {
    
    let testSize = CGFloat(10)
    
    let testFontType = FontType.bold
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHelveticaNeueFont() {
        let helveticaNeue = UIFont.HelveticaNeue(type: testFontType, size: testSize)
        XCTAssertEqual(helveticaNeue.fontName, FontName.helveticaNeue.rawValue + "-" + testFontType.rawValue)
        XCTAssertEqual(helveticaNeue.pointSize, testSize)
    }
    
    func testAvenirNextFont() {
        let avenirNext = UIFont.AvenirNext(type: FontType.bold, size: testSize)
        XCTAssertEqual(avenirNext.fontName, FontName.avenirNext.rawValue + "-" + testFontType.rawValue)
        XCTAssertEqual(avenirNext.pointSize, testSize)
    }
    
    func testAvenirNextRegularFont() {
        let avenirNextRegular = UIFont.AvenirNextRegular(size: testSize)
        XCTAssertEqual(avenirNextRegular.fontName, FontName.avenirNext.rawValue + "-" + FontType.regular.rawValue)
        XCTAssertEqual(avenirNextRegular.pointSize, testSize)
    }
    
    func testAvenirNextDemiBold() {
        let avenirNextDemiBold = UIFont.AvenirNextDemiBold(size: testSize)
        XCTAssertEqual(avenirNextDemiBold.fontName, FontName.avenirNext.rawValue + "-" + FontType.demiBold.rawValue)
        XCTAssertEqual(avenirNextDemiBold.pointSize, testSize)
    }
}

