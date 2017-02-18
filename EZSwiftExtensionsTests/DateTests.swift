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
    let format = "dd-MM-yyyy hh:mm:ss"

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
        
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertEqual(yesterday?.timePassed(), "1 day ago")
        
        let fiveSecondsAgo = Calendar.current.date(byAdding: .second, value: -5,to: today)
        XCTAssertEqual(fiveSecondsAgo?.timePassed(), "5 seconds ago")
        
        let sixHoursAgo = Calendar.current.date(byAdding: .hour, value: -6,to: today)
        XCTAssertEqual(sixHoursAgo?.timePassed(), "6 hours ago")
        
        let twoMonthsAgo = Calendar.current.date(byAdding: .month, value: -2,to: today)
        XCTAssertEqual(twoMonthsAgo?.timePassed(), "2 months ago")
        
        let fifteenYearsAgo = Calendar.current.date(byAdding: .year, value: -15,to: today)
        XCTAssertEqual(fifteenYearsAgo?.timePassed(), "15 years ago")
    }
    
    func testIsPast() {
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertTrue(beginningOfUnixTime.isPast)
        
        let today = Date()
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertTrue((yesterday?.isPast)!)
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1,to: today)
        XCTAssertFalse((tomorrow?.isPast)!)
    }
    
    func testIsFuture() {
        let distantFuture = Date(httpDateString: "Sun Nov 6 08:49:37 5000")
        XCTAssertTrue((distantFuture?.isFuture)!)
        
        let today = Date()
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertFalse((yesterday?.isFuture)!)
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1,to: today)
        XCTAssertTrue((tomorrow?.isFuture)!)
    }
    
    func testIsToday() {
        let today = Date()
        XCTAssertTrue(today.isToday)
        
        let beginningOfUnixTime = Date(timeIntervalSince1970: 0)
        XCTAssertFalse(beginningOfUnixTime.isToday)
    }
    
    func testIsTomorrow() {
        let today = Date()
        XCTAssertFalse(today.isTomorrow)
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1,to: today)
        XCTAssertTrue((tomorrow?.isTomorrow)!)
    }
    
    func testIsYesterday() {
        let today = Date()
        XCTAssertFalse(today.isYesterday)
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertTrue((yesterday?.isYesterday)!)
    }
    
    func testIsThisWeek() {
        let today = Date()
        XCTAssertTrue(today.isThisWeek)
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertTrue((yesterday?.isThisWeek)!)
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1,to: today)
        XCTAssertTrue((tomorrow?.isThisWeek)!)
        
        XCTAssertFalse(Date.distantPast.isThisWeek)
    }
    
    func testIsThisMonth() {
        let today = Date()
        XCTAssertTrue(today.isThisMonth)
        
        // Its difficult to unit test (by checking a few days prior) because builds might fail
        // on the first day of every month. 
        let aFewSecondsBefore = Calendar.current.date(byAdding: .second, value: -5,to: today)
        XCTAssertTrue((aFewSecondsBefore?.isThisMonth)!)
        
        let aFewSecondsAfter = Calendar.current.date(byAdding: .second, value: -5,to: today)
        XCTAssertTrue((aFewSecondsAfter?.isThisMonth)!)
        
        XCTAssertFalse(Date.distantPast.isThisMonth)
    }
    
    func testEra() {
        let customDate = Date(fromString: "12-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.era, Calendar.current.component(Calendar.Component.era, from:customDate!))
    }
    
    func testYear() {
        let customDate = Date(fromString: "12-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.year, 2015)
    }
    
    func testMonth() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.month, 1)
    }
    
    func testMonthAsString() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.monthAsString, "January")
        
        let customDate2 = Date(fromString: "10-03-2009 05:45:12", format: self.format)
        XCTAssertEqual(customDate2?.monthAsString, "March")
        
        let customDate3 = Date(fromString: "11-11-2012 05:45:12", format: self.format)
        XCTAssertEqual(customDate3?.monthAsString, "November")
    }
    
    func testWeekDay() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.weekday, "Friday")
    }
    
    func testDay() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.day, 9)
    }
    
    func testHour() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.hour, 5)
    }
    
    func testMinute() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.minute, 45)
    }
    
    func testSecond() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.second, 12)
    }
    
    func testNanoSecond() {
        let customDateWithoutNanoSecondDefined =
            Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDateWithoutNanoSecondDefined?.nanosecond, 0)
        
        let today = Date()
        XCTAssert(today.nanosecond == Calendar.current.component(.nanosecond, from: today))
    }
    
    func testISO8601() {
        let customDate = Date(fromString: "09-01-2015 05:45:12", format: self.format)
        XCTAssertEqual(customDate?.iso8601, "2015-01-09T05:45:12Z")
    }
}
