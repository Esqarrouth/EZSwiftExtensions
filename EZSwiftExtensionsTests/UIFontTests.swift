//
//  UIFontTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UIFontTests: XCTestCase {
    
    let TEST_SIZE = CGFloat(10)
    
    let TEST_FONT_TYPE = FontType.Bold
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHelveticaNeueFont() {
        let helveticaNeue = UIFont.HelveticaNeue(type: TEST_FONT_TYPE, size: TEST_SIZE)
        XCTAssertEqual(helveticaNeue.fontName, FontName.HelveticaNeue.rawValue + "-" + TEST_FONT_TYPE.rawValue)
        XCTAssertEqual(helveticaNeue.pointSize, TEST_SIZE)
    }
    
    func testAvenirNextFont() {
        let avenirNext = UIFont.AvenirNext(type: FontType.Bold, size: TEST_SIZE)
        XCTAssertEqual(avenirNext.fontName, FontName.AvenirNext.rawValue + "-" + TEST_FONT_TYPE.rawValue)
        XCTAssertEqual(avenirNext.pointSize, TEST_SIZE)
    }
    
    func testAvenirNextRegularFont() {
        let avenirNextRegular = UIFont.AvenirNextRegular(size: TEST_SIZE)
        XCTAssertEqual(avenirNextRegular.fontName, FontName.AvenirNext.rawValue + "-" + FontType.Regular.rawValue)
        XCTAssertEqual(avenirNextRegular.pointSize, TEST_SIZE)
    }
    
    func testAvenirNextDemiBold() {
        let avenirNextDemiBold = UIFont.AvenirNextDemiBold(size: TEST_SIZE)
        XCTAssertEqual(avenirNextDemiBold.fontName, FontName.AvenirNext.rawValue + "-" + FontType.DemiBold.rawValue)
        XCTAssertEqual(avenirNextDemiBold.pointSize, TEST_SIZE)
    }
}

#endif

