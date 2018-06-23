//
//  StringTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 29/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class StringTests: XCTestCase {
    var string: String!

    override func setUp() {
        super.setUp()
        string = "0123456789"
    }

    func testSubscript() {
        let string = "0123456789"
        XCTAssertEqual(string[2], "2")
        XCTAssertEqual(string[9], "9")
        XCTAssertEqual(string[0..<10], "0123456789")
        XCTAssertEqual(string[3..<5], "34")
        XCTAssertEqual(string[0...9], "0123456789")
        XCTAssertEqual(string[8...9], "89")
    }

    func testCapitalization() {
        string = "lorem ipsum"
        XCTAssertEqual(string.capitalizedFirst(), "Lorem ipsum")
        string = ""
        XCTAssertEqual(string.capitalizedFirst(), "")

        string = "eZSwiftExtensions"
        string.capitalizeFirst()
        XCTAssertEqual(string, "EZSwiftExtensions")
        string = ""
        string.capitalizeFirst()
        XCTAssertEqual(string, "")

        string = "ezswiftExtensions"
        string.uppercasePrefix(-7)
        XCTAssertEqual(string, "ezswiftExtensions")
        XCTAssertEqual(string.uppercasedPrefix(0), "ezswiftExtensions")
        XCTAssertEqual(string.uppercasedPrefix(5), "EZSWIftExtensions")
        string.uppercasePrefix(3)
        XCTAssertEqual(string, "EZSwiftExtensions")
        string = "ez swift extensions"
        XCTAssertEqual(string.uppercasedPrefix(string.length + 1), "EZ SWIFT EXTENSIONS")
        XCTAssertEqual(string, "ez swift extensions")
        string.uppercasePrefix(string.length + 14)
        XCTAssertEqual(string, "EZ SWIFT EXTENSIONS")

        string = "ezswiftExtensions"
        string.uppercaseSuffix(0)
        XCTAssertEqual(string, "ezswiftExtensions")
        XCTAssertEqual(string.uppercasedSuffix(-3), "ezswiftExtensions")
        XCTAssertEqual(string.uppercasedSuffix(6), "ezswiftExteNSIONS")
        string.uppercaseSuffix(4)
        XCTAssertEqual(string, "ezswiftExtensIONS")
        string = "ez swift extensions"
        XCTAssertEqual(string.uppercasedSuffix(string.length + 1), "EZ SWIFT EXTENSIONS")
        XCTAssertEqual(string, "ez swift extensions")
        string.uppercaseSuffix(string.length + 14)
        XCTAssertEqual(string, "EZ SWIFT EXTENSIONS")

        string = "ezswiftExtensions"
        XCTAssertEqual(string.uppercased(range: string.length+1..<string.length+15), "ezswiftExtensions")
        string.uppercase(range: string.length+7..<string.length+99)
        XCTAssertEqual(string, "ezswiftExtensions")
        XCTAssertEqual(string.uppercased(range: -5..<5), "EZSWIftExtensions")
        XCTAssertEqual(string.uppercased(range: 4..<10), "ezswIFTEXTensions")
        string.uppercase(range: 8..<13)
        XCTAssertEqual(string, "ezswiftEXTENSions")
    }

    func testLowercase() {
        string = "LoReM IpSuM"
        XCTAssertEqual(string.lowercasedFirst(), "loReM IpSuM")
        string = "EZSwiftExtensions"
        string.lowercaseFirst()
        XCTAssertEqual(string, "eZSwiftExtensions")

        string = "EzSWIFTeXTENSIONs"
        string.lowercasePrefix(-7)
        XCTAssertEqual(string, "EzSWIFTeXTENSIONs")
        XCTAssertEqual(string.lowercasedPrefix(0), "EzSWIFTeXTENSIONs")
        XCTAssertEqual(string.lowercasedPrefix(5), "ezswiFTeXTENSIONs")
        string.lowercasePrefix(3)
        XCTAssertEqual(string, "ezsWIFTeXTENSIONs")
        string = "EZ SWIFT EXTENSIONS"
        XCTAssertEqual(string.lowercasedPrefix(string.length + 1), "ez swift extensions")
        XCTAssertEqual(string, "EZ SWIFT EXTENSIONS")
        string.lowercasePrefix(string.length + 14)
        XCTAssertEqual(string, "ez swift extensions")

        string = "EzSWIFTeXTENSIonS"
        string.lowercaseSuffix(0)
        XCTAssertEqual(string, "EzSWIFTeXTENSIonS")
        XCTAssertEqual(string.lowercasedSuffix(-3), "EzSWIFTeXTENSIonS")
        XCTAssertEqual(string.lowercasedSuffix(6), "EzSWIFTeXTEnsions")
        string.lowercaseSuffix(4)
        XCTAssertEqual(string, "EzSWIFTeXTENSions")
        string = "EZ SWIFT EXTENSIONS"
        XCTAssertEqual(string.lowercasedSuffix(string.length + 1), "ez swift extensions")
        XCTAssertEqual(string, "EZ SWIFT EXTENSIONS")
        string.lowercaseSuffix(string.length + 14)
        XCTAssertEqual(string, "ez swift extensions")

        string = "EzSWIFTeXTENSIonS"
        XCTAssertEqual(string.lowercased(range: string.length+1..<string.length+15), "EzSWIFTeXTENSIonS")
        string.lowercase(range: string.length+7..<string.length+99)
        XCTAssertEqual(string, "EzSWIFTeXTENSIonS")
        XCTAssertEqual(string.lowercased(range: -5..<5), "ezswiFTeXTENSIonS")
        XCTAssertEqual(string.lowercased(range: 4..<10), "EzSWiftextENSIonS")
        string.lowercase(range: 8..<13)
        XCTAssertEqual(string, "EzSWIFTextensIonS")
    }

    func testIsBlank() {
        let emptyString = " \n "
        XCTAssertFalse(string.isBlank)
        XCTAssertTrue(emptyString.isBlank)
    }

    func testTrim() {
        string = "  Hello how are you   "
        string.trim()
        XCTAssertEqual(string, "Hello how are you")

        string = "  \t\t  Lets trim all the whitespace  \n \t  \n  "
        string.trim()
        XCTAssertEqual(string, "Lets trim all the whitespace")
    }

    func testIsEmail() {
        XCTAssertFalse(string.isEmail)
        string = "test@test.com"
        XCTAssertTrue(string.isEmail)
        string = "test@test"
        XCTAssertFalse(string.isEmail)
        string = "test@test."
        XCTAssertFalse(string.isEmail)
        string = "1@1.1"
        XCTAssertFalse(string.isEmail)
    }

    func testExtractURLs() {
        string = "http://google.com http fpt:// http://facebook.com test"
        let urls = string.extractURLs
        XCTAssertEqual(urls.count, 2)
    }

    func testContains() {
        XCTAssertTrue(string.contains("01", compareOption: String.CompareOptions.anchored))
        XCTAssertFalse(string.contains("12", compareOption: String.CompareOptions.anchored))
    }

    func testConversions() {
        XCTAssertNotNil(string.toInt())
        string = "abc"
        XCTAssertNil(string.toInt())
        string = ""
        XCTAssertNil(string.toInt())

        string = "0.12"//Assumed USA locale, change to "," if EU
        XCTAssertNotNil(string.toDouble())
        XCTAssertNotNil(string.toFloat())
        XCTAssertEqual(String(10.253, precision: 2), "10.25")
        XCTAssertEqual(String(10.257, precision: 2), "10.26")
        XCTAssertTrue(string.toNSString.isKind(of: NSString.self))
    }

    func testIsIncludeEmoji() {
        string = "Incididunt tempor ad 😃 sint Lorem amet 🍷 Elit ut dolore ad est qui magna 🍻"
        XCTAssertTrue(string.includesEmoji())

        string = "The greatest respect that writers can give their readers is to not write anything that they expect"
        XCTAssertFalse(string.includesEmoji())
    }

    func testBase64Conversion() {
        let string = "EZSwiftExtensions is Awesome"
        let base64String = "RVpTd2lmdEV4dGVuc2lvbnMgaXMgQXdlc29tZQ"
        let base64StringPadded = "RVpTd2lmdEV4dGVuc2lvbnMgaXMgQXdlc29tZQ=="
        XCTAssertEqual(string.base64, base64StringPadded)
        let newString = String(base64: base64String) ?? ""
        XCTAssertEqual(newString, string)
    }

    func testStatsFuncs() {
        let string = "EZSwiftExtensions is Awesome, let's revolutionize Swift\nI love it.\n"
        XCTAssertEqual(string.countofWords, 10)
        XCTAssertEqual(string.countofParagraphs, 2)
        XCTAssertEqual(string.positionOfSubstring("Awesome"), 21)
        XCTAssertEqual(string.split(" ")[3], "let's")
        switch string {
        case hasPrefix("EZSwift"):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
        switch string {
        case hasSuffix(" it.\n"):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testToBool() {
        let bool1 = "true"
        let bool2 = "false"
        let bool3 = "lolol"
        let bool4 = "TRUE"
        let bool5 = "True"
        
        XCTAssertTrue(bool1.toBool()!)
        XCTAssertTrue(bool4.toBool()!)
        XCTAssertTrue(bool5.toBool()!)
        XCTAssertFalse(bool2.toBool()!)
        XCTAssertNil(bool3.toBool())
    }
    
    func testUrlEncoded() {
        let unchangedString = "abcde"
        let urlEncodedUnChangedString = unchangedString.urlEncoded()
        
        XCTAssertEqual(unchangedString, urlEncodedUnChangedString)
        
        let escapeCharString = "\n\t"
        let urlEncodeEscapeCharString = escapeCharString.urlEncoded()
        
        XCTAssertEqual("%0A%09", urlEncodeEscapeCharString)
        
        let mixedString = "ab\ncd"
        let urlEncodedMixedString = mixedString.urlEncoded()
        
        XCTAssertEqual("ab%0Acd", urlEncodedMixedString)
        
        let spacedString = "a b c d e"
        let urlEncodedSpacedString = spacedString.urlEncoded()
        
        XCTAssertEqual("a%20b%20c%20d%20e", urlEncodedSpacedString)
    }
    
    func testUrlEncode() {
        var unchangedString = "abcde"
        unchangedString.urlEncode()
        
        XCTAssertEqual("abcde", unchangedString)
        
        var escapeCharString = "\n\t"
        escapeCharString.urlEncode()
        
        XCTAssertEqual("%0A%09", escapeCharString)
        
        var mixedString = "ab\ncd"
        mixedString.urlEncode()
        
        XCTAssertEqual("ab%0Acd", mixedString)
        
        var spacedString = "a b c d e"
        spacedString.urlEncode()
        
        XCTAssertEqual("a%20b%20c%20d%20e", spacedString)
    }
    
    func testUrlDecoded() {
        let unchangedString = "abcde"
        let urlDecodedUnChangedString = unchangedString.urlDecoded()
        
        XCTAssertEqual(unchangedString, urlDecodedUnChangedString)
        
        let urlEncodedEscapeCharString =  "%0A%09"
        let escapeCharString = urlEncodedEscapeCharString.urlDecoded()
        
        XCTAssertEqual("\n\t", escapeCharString)
        
        let urlEncodedMixedString = "ab%0Acd"
        let mixedString = urlEncodedMixedString.urlDecoded()
        
        XCTAssertEqual("ab\ncd", mixedString)
        
        let urlEncodedSpacedString = "a%20b%20c%20d%20e"
        let spacedString  = urlEncodedSpacedString.urlDecoded()
        
        XCTAssertEqual("a b c d e", spacedString)
    }
    
    func testUrlDecode() {
        var unchangedString = "abcde"
        unchangedString.urlDecode()
        
        XCTAssertEqual("abcde", unchangedString)
        
        var escapeCharString = "%0A%09"
        escapeCharString.urlDecode()
        
        XCTAssertEqual("\n\t", escapeCharString)
        
        var mixedString = "ab%0Acd"
        mixedString.urlDecode()
        
        XCTAssertEqual("ab\ncd", mixedString)
        
        var spacedString = "a%20b%20c%20d%20e"
        spacedString.urlDecode()
        
        XCTAssertEqual("a b c d e" , spacedString)
    }

    func testSplitSeparator() {
        
        let testString = "Hey-Ho-Lets-Go"
        let expectedResult = ["Hey","Ho","Lets","Go"]
        
        XCTAssertEqual(testString.split("-"), expectedResult)
    }
    
    func testSplitCharacterSet() {
        
        let testString = "HeyHoLetsGo"
        let expectedResult = ["H","H","L","G"]
        
        XCTAssertEqual(testString.split(.lowercaseLetters), expectedResult)
    }
    
    func testIndexOf() {
        
        let testString = "HeyHoLetsGo"
        let expectedResult = 5
        
        XCTAssertEqual(testString.getIndexOf("L"), expectedResult)
        
        XCTAssertEqual(testString.getIndexOf("X"), nil)
    }
    
    func testCount() {
        
        let testString = "HeyHoLetsGo"
        let expectedResult = 2
        
        XCTAssertEqual(testString.count("o"), expectedResult)
    }

    func testMatchRegex() {
        
        let testString = "H3yH0L3tsG0"
        let expectedResult = ["3","0","3","0"]
        
        XCTAssertEqual(testString.matchesForRegexInText("[0-9]"), expectedResult)
    }
    
    func testIsNumber() {
        
        let testString1 = "E"
        let testString2 = "3"
        let testString3 = "👻"
        let testString4 = "3.333"

        XCTAssertEqual(testString1.isNumber(), false)
        XCTAssertEqual(testString2.isNumber(), true)
        XCTAssertEqual(testString3.isNumber(), false)
        XCTAssertEqual(testString4.isNumber(), true)
    }
    
    func testAttributed() {
        
        #if os(iOS)
        let testString = "meh"
        let testString2 = "✅"

            let boldResult = NSAttributedString(string: testString, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
            let boldResult2 = NSAttributedString(string: testString2, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
            let underlineResult = NSAttributedString(string: testString, attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
            let underlineResult2 = NSAttributedString(string: testString2, attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])

            let italicResult = NSAttributedString(string: testString, attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
            let italicResult2 = NSAttributedString(string: testString2, attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])

            let colorResult = NSAttributedString(string: testString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.green])
            let colorResult2 = NSAttributedString(string: testString2, attributes: [NSAttributedStringKey.foregroundColor: UIColor.green])

        XCTAssertEqual(testString.bold(), boldResult)
        XCTAssertEqual(testString.underline(), underlineResult)
        XCTAssertEqual(testString.italic(), italicResult)
        XCTAssertEqual(testString.color(.green), colorResult)
        XCTAssertEqual(testString2.bold(), boldResult2)
        XCTAssertEqual(testString2.underline(), underlineResult2)
        XCTAssertEqual(testString2.italic(), italicResult2)
        XCTAssertEqual(testString2.color(.green), colorResult2)

        #endif
    }
}
