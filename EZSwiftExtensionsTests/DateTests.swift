//
//  DateTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {
    // note that Date uses UTC in Date(timeIntervalSince1970: _)

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

    func testDaysInBetween() {
        // Given
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSinceReferenceDate: 0)
        let expectedResult: Double = 978_307_200 / 86_400

        // When
        let actualResult = floor(date1.daysInBetweenDate(date2))

        // Test
        XCTAssertEqual(actualResult, expectedResult)
    }

    func testHoursInBetween() {
        // Given
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSinceReferenceDate: 0)
        let expectedResult: Double = 978_307_200 / 3_600

        // When
        let actualResult = date1.hoursInBetweenDate(date2)

        // Test
        XCTAssertEqual(actualResult, expectedResult)
    }

    func testMinutesInBetween() {
        // Given
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSinceReferenceDate: 0)
        let expectedResult: Double = 978_307_200 / 60

        // When
        let actualResult = date1.minutesInBetweenDate(date2)

        // Test
        XCTAssertEqual(actualResult, expectedResult)
    }

    func testSecondsInBetween() {
        // Given
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSinceReferenceDate: 0)
        let expectedResult: Double = 978_307_200

        // When
        let actualResult = date1.secondsInBetweenDate(date2)

        // Test
        XCTAssertEqual(actualResult, expectedResult)
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
    
    func testIsToday() {
        let today = Date()
        XCTAssertTrue(today.isToday)
        
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertFalse(beginningOfUnixTime.isToday)
    }
    
    func testYear() {
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(beginningOfUnixTime.year, 1969)
        
        let newMillenium = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertEqual(newMillenium.year, 2000)
        
        let customDate = Date(fromString: "12-01-2015 05:45:12", format: self.format)
        
        XCTAssertEqual(customDate?.year, 2015)
    }
    
    func testMonth() {
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(beginningOfUnixTime.month, 12)
        
        let newMillenium = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertEqual(newMillenium.month, 12)
        
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        
        XCTAssertEqual(customDate?.month, 1)
    }
    
    func testDay() {
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(beginningOfUnixTime.day, 31)
        
        let newMillenium = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertEqual(newMillenium.day, 31)
        
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        
        XCTAssertEqual(customDate?.day, 9)
    }
}
