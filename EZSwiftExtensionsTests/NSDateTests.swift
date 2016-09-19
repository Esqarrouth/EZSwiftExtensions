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
    let currentCalendar = NSCalendar.currentCalendar()

    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
        wrongDateString = "13-82-1900 90:65:12"
    }

    func testDateFromString() {
        guard let dateFromString = NSDate(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.dateFromString(string)
        XCTAssertEqual(dateFromString, dateString)
        XCTAssertNil(NSDate(fromString: wrongDateString, format: format), "Date From String initialized, but source string was invalid.")
    }

    func testDateToString() {
        let date = NSDate(timeIntervalSince1970: 0)

        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.stringFromDate(date)

        XCTAssertEqual(date.toString(format: format), dateString)
    }

    func testTimePassedBetweenDates() {
        let date = NSDate(timeIntervalSince1970: 0)
        XCTAssertTrue(date.timePassed().containsString("years"))
        let now = NSDate()
        XCTAssertTrue(now.timePassed().containsString("now") || now.timePassed().containsString("seconds"))
    }

    func testComparable() {
        let date = NSDate()
        let future = NSDate(timeIntervalSinceNow: 1000)
        XCTAssertTrue(date < future)
        XCTAssertFalse(date > future)
        XCTAssertTrue(date == date)
    }
}

extension EZSwiftExtensionsTestsNSDate {

    func testStartOfDay() {
        let today = NSDate(), startOfDay = today.startOfDay
        XCTAssertLessThanOrEqual(startOfDay, today)
        let dateComponents = currentCalendar.components([.Hour, .Minute, .Second], fromDate: startOfDay)
        XCTAssertEqual([dateComponents.hour, dateComponents.minute, dateComponents.second], [0, 0, 0])
        XCTAssertEqual(today.toString(timeStyle: .NoStyle), startOfDay.toString(timeStyle: .NoStyle))
    }

    func testEndOfDay() {
        let today = NSDate(), endOfDay = today.endOfDay
        XCTAssertGreaterThanOrEqual(endOfDay, today)
        let dateComponents = currentCalendar.components([.Hour, .Minute, .Second], fromDate: endOfDay)
        XCTAssertEqual([dateComponents.hour, dateComponents.minute, dateComponents.second], [23, 59, 59])
        XCTAssertEqual(today.toString(timeStyle: .NoStyle), endOfDay.toString(timeStyle: .NoStyle))
    }

}
