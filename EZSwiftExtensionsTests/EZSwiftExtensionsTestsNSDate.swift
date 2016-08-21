//
//  EZSwiftExtensionsTestsNSDate.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class EZSwiftExtensionsTestsNSDate: XCTestCase {
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
        XCTAssertTrue(date <= future)
        XCTAssertFalse(date >= future)
    }

    func testTodayYesterday() {
        let today = NSDate()
        XCTAssertTrue(today.isToday)
        XCTAssertFalse(today.isYesterday)
        let yesterday = NSDate(timeIntervalSinceNow: -24*60*60)
        XCTAssertFalse(yesterday.isToday)
        XCTAssertTrue(yesterday.isYesterday)
        let distantFuture = NSDate.distantFuture()
        XCTAssertFalse(distantFuture.isToday)
        XCTAssertFalse(distantFuture.isYesterday)
    }

    func testComponents() {
        guard let timeZone = NSCalendar.currentCalendar().components([.TimeZone], fromDate: NSDate()).timeZone else {
            XCTFail("Couldn't determine timezone.")
            return
        }
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(1471765313 - timeZone.secondsFromGMT))
        XCTAssertEqual(date.getComponent(.Era), 1)
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.getComponent(.Year), 2016)
        XCTAssertEqual(date.month, 8)
        XCTAssertEqual(date.getComponent(.Month), 8)
        XCTAssertEqual(date.day, 21)
        XCTAssertEqual(date.getComponent(.Day), 21)
        XCTAssertEqual(date.hours, 7)
        XCTAssertEqual(date.getComponent(.Hour), 7)
        XCTAssertEqual(date.minutes, 41)
        XCTAssertEqual(date.getComponent(.Minute), 41)
        XCTAssertEqual(date.seconds, 53)
        XCTAssertEqual(date.getComponent(.Second), 53)
        XCTAssertEqual(date.getComponent(.Weekday), 1)
        XCTAssertEqual(date.getComponent(.WeekdayOrdinal), 3)
        XCTAssertEqual(date.getComponent(.WeekOfMonth), 4)
        XCTAssertEqual(date.getComponent(.WeekOfYear), 35)
//        XCTAssertEqual(date.getComponent(.Calendar), 0)
        XCTAssertEqual(date.getComponent(.Quarter), 2)
        XCTAssertEqual(date.getComponent(.Nanosecond), 0)
        XCTAssertEqual(date.getComponent(.YearForWeekOfYear), 2016)
//        XCTAssertEqual(date.getComponent(.TimeZone), 0)

    }

    func testAstro() {

    }
}
