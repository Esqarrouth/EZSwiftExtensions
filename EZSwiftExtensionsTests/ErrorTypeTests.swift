//
//  ErrorTypeTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

enum CustomErrorEnum: ErrorType {
    case CustomError, AnotherError
}

struct CustomErrorStruct: ErrorType { }

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

    var enumError: CustomErrorEnum!
    var structError: CustomErrorStruct!
    var classError: CustomErrorClass!

    override func setUp() {
        super.setUp()
        enumError = .CustomError
        structError = CustomErrorStruct()
        classError = CustomErrorClass(description: "Custom Error To String")
    }

    func testToString() {
        XCTAssertEqual(enumError.toString, "CustomError")
        enumError = .AnotherError
        XCTAssertEqual(enumError.toString, "AnotherError")
        XCTAssertEqual(structError.toString, "CustomErrorStruct")
        XCTAssertEqual(classError.toString, "Custom Error To String")
    }

}
