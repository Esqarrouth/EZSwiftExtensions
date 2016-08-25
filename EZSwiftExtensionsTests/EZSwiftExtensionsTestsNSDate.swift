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
    let timeInterval = NSTimeInterval(1471765313.23) //08/21/2016 @ 7:41am (UTC)

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

    func testDateComponents() {
        guard let timeZone = NSCalendar.currentCalendar().components([.TimeZone], fromDate: NSDate()).timeZone else {
            XCTFail("Couldn't determine timezone.")
            return
        }
        let date = NSDate(timeIntervalSince1970: timeInterval - NSTimeInterval(timeZone.secondsFromGMT))
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 8)
        XCTAssertEqual(date.day, 21)
        XCTAssertEqual(date.hours, 7)
        XCTAssertEqual(date.minutes, 41)
        XCTAssertEqual(date.seconds, 53)
    }

    func testAstro() {
        var date = NSDate(timeIntervalSince1970: 1452556800) //01/12/2016 @ 12:00am (UTC)
        XCTAssertEqual(date.astro, "Capricorn")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Aquarius")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Pisces")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Aries")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Taurus")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Gemini")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Cancer")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Leo")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Virgo")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Libra")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Scorpio")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Sagittarius")
        date = date.dateByAddingTimeInterval(30*24*60*60)
        XCTAssertEqual(date.astro, "Capricorn")
    }

    func testFromHttpDateString() {
        let testDate = NSDate(timeIntervalSince1970: 1124121121)
        let rfc822 = "Mon, 15 Aug 05 15:52:01 +0000"
        XCTAssertEqual(NSDate(httpDateString: rfc822), testDate)
        let rfc850 = "Monday, 15-Aug-05 15:52:01 UTC"
        XCTAssertEqual(NSDate(httpDateString: rfc850), testDate)
        let rfc1036 = "Mon, 15 Aug 05 15:52:01 +0000"
        XCTAssertEqual(NSDate(httpDateString: rfc1036), testDate)
        let rfc1123 = "Mon, 15 Aug 2005 15:52:01 +0000"
        XCTAssertEqual(NSDate(httpDateString: rfc1123), testDate)
        let rfc2822 = "Mon, 15 Aug 2005 15:52:01 +0000"
        XCTAssertEqual(NSDate(httpDateString: rfc2822), testDate)
        let rfc3339 = "2005-08-15T15:52:01+00:00"
        XCTAssertEqual(NSDate(httpDateString: rfc3339), testDate)
        let iso8601 = "2005-08-15T15:52:01+0000"
        XCTAssertEqual(NSDate(httpDateString: iso8601), testDate)
        XCTAssertNil(NSDate(httpDateString: wrongDateString))
    }
}
