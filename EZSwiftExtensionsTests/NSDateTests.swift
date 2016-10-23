//
//  NSDateTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class NSDateTests: XCTestCase {
    // note that NSDate uses UTC in NSDate(timeIntervalSince1970: _)

    var string: String!
    var wrongDateString: String!
    let format = "dd-mm-yyyy hh:mm:ss"

    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
        wrongDateString = "13-82-1900 90:65:12"
    }

    func testDateFromString() {
        guard let dateFromString = Date(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.date(from: string)
        XCTAssertEqual(dateFromString, dateString)
        XCTAssertNil(Date(fromString: wrongDateString, format: format), "Date From String initialized, but source string was invalid.")
        
        let dateFromFalseStr = Date(fromString: "lol", format: "haha")
        XCTAssertNil(dateFromFalseStr)
    }

    func testHTTPDateString() {
        // Given
        let expectedResult = Date(timeIntervalSince1970: 784_111_777)
        let fromGMT = TimeInterval(NSTimeZone.local.secondsFromGMT())

        // When
        let rfc1123 = Date(httpDateString: "Sun, 06 Nov 1994 08:49:37 GMT")
        let rfc850 = Date(httpDateString: "Sunday, 06-Nov-94 08:49:37 GMT")
        let asctime = Date(httpDateString: "Sun Nov  6 08:49:37 1994")
        let invalid = Date(httpDateString: "1994-11-06 08:49:37")

        // Test
        XCTAssertEqual(rfc1123, expectedResult)
        XCTAssertEqual(rfc850, expectedResult)
        XCTAssertEqual(asctime?.addingTimeInterval(fromGMT), expectedResult)
        XCTAssertNil(invalid)
    }

    func testDateToString() {
        let date = Date(timeIntervalSince1970: 0)

        let formatter = DateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.string(from: date)

        XCTAssertEqual(date.toString(format: format), dateString)
    }

    func testTimePassedBetweenDates() {
        // Given
        let years = Date(timeIntervalSince1970: 0)
        let months = Date(timeIntervalSinceNow: -8_388_608)
        let days = Date(timeIntervalSinceNow: -262_144)
        let hours = Date(timeIntervalSinceNow: -65_536)
        let minutes = Date(timeIntervalSinceNow: -2_048)
        let now = Date()

        // Test
        XCTAssertTrue(years.timePassed().contains("years"))
        XCTAssertTrue(months.timePassed().contains("months"))
        XCTAssertTrue(days.timePassed().contains("days"))
        XCTAssertTrue(hours.timePassed().contains("hours"))
        XCTAssertTrue(minutes.timePassed().contains("minutes"))
        XCTAssertTrue(now.timePassed().contains("now") || now.timePassed().contains("seconds"))
    }

}
