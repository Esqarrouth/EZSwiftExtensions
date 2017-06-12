//
//  NSAttributedStringTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

@testable import EZSwiftExtensions

class NSAttributedStringTests: XCTestCase {
    
    let testAttributedString = NSAttributedString(string: "Swift Attributed String",
                                                  attributes: [String:Any]())
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    #if os(iOS)
    
    func testBold() {
        
        let boldString = testAttributedString.bold()
        let newAttributesSeen = boldString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, boldString.length))
        
        XCTAssertEqual(newAttributesSeen[NSFontAttributeName] as! UIFont, UIFont.boldSystemFont(ofSize: UIFont.systemFontSize))
    }
    
    #endif
    
    #if os(iOS) || os(tvOS)
    
    func testUnderLine() {
        let underLineString = testAttributedString.underline()
        let newAttributesSeen = underLineString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, underLineString.length))
        
        XCTAssertEqual(newAttributesSeen[NSUnderlineStyleAttributeName] as! Int, NSUnderlineStyle.styleSingle.rawValue)
    }
    
    #endif
    
    #if os(iOS)
    
    func testItalic() {
        let italicString = testAttributedString.italic()
        let newAttributesSeen = italicString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, italicString.length))
        
        XCTAssertEqual(newAttributesSeen[NSFontAttributeName] as! UIFont, UIFont.italicSystemFont(ofSize: UIFont.systemFontSize))
    }
    
    func testStrikethrough() {
        let strikeThroughString = testAttributedString.strikethrough()
        let newAttributesSeen = strikeThroughString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, strikeThroughString.length))
        
        XCTAssertEqual(newAttributesSeen[NSStrikethroughStyleAttributeName] as! NSNumber, NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int))
    }
    
    #endif
    
    #if os(iOS) || os(tvOS)
    
    func testColor() {
        let grayColor = UIColor(gray: 0)
        let coloredString = testAttributedString.color(grayColor)
        let newAttributesSeen = coloredString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, coloredString.length))
        
        XCTAssertEqual(newAttributesSeen[NSForegroundColorAttributeName] as! UIColor, grayColor)
    }
    
    func testAppending() {
        
        var string = NSAttributedString(string: "EZSwiftExtensions")
        let string2 = NSAttributedString(string: " is Awesome!")
        
        string += string2
        let expected = NSAttributedString(string: "EZSwiftExtensions is Awesome!")

        XCTAssertEqual(string, expected)
    }
    
    #endif
}

