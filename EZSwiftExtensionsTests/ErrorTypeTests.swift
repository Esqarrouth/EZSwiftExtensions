//
//  ErrorTypeTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

enum ErrorEnum: String, ErrorType {
    case CustomError
    case AnotherError = "String Another Error"
}

struct ErrorStruct: ErrorType { }

class ErrorClass: ErrorType { }

class CustomErrorClass: ErrorType {
    let description: String
    init(description: String) {
        self.description = description
    }
    var toString: String {
        return description
    }
}

class ErrorTypeTests: XCTestCase {

    var enumError: ErrorEnum!
    var structError: ErrorStruct!
    var classError: ErrorClass!
    var customClassError: CustomErrorClass!

    override func setUp() {
        super.setUp()
        enumError = .CustomError
        structError = ErrorStruct()
        classError = ErrorClass()
        customClassError = CustomErrorClass(description: "Custom Error To String")
    }

    func testToString() {
        XCTAssertEqual(enumError.toString, "CustomError")
        enumError = .AnotherError
        XCTAssertEqual(enumError.toString, "String Another Error")
        XCTAssertEqual(structError.toString, "ErrorStruct")
        XCTAssertEqual(classError.toString, "ErrorClass")
        XCTAssertEqual(customClassError.toString, "Custom Error To String")
    }

}
