//
//  DateTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class DateTests: XCTestCase {
    // note that Date uses UTC in Date(timeIntervalSince1970: _)

    var dateString: String!
    var invalidDateString: String!
    var date: Date!
    var timeZoneOffset: TimeInterval!
    let format = "yyyy-MM-dd'T'HH:mm:ssxxxxx"

    override func setUp() {
        super.setUp()
        self.dateString = "2015-11-14T16:05:11+00:00" // time of the first commit of EZSwiftExtension :clap::clap:
        self.invalidDateString = "9999-99-99T99:99:99+00:00"
        self.date = Date(fromString: self.dateString, format: self.format)!
        NSTimeZone.default = TimeZone(abbreviation: "SGT")! // set timezone to be SGT
        self.timeZoneOffset = TimeInterval(NSTimeZone.local.secondsFromGMT())
    }

    func testDateFromString() {
        
        guard let dateFromString = Date(fromString: self.dateString, format: self.format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        
        NSTimeZone.default = TimeZone(abbreviation: "UTC")! // set timezone to be UTC to match with original string
        XCTAssertEqual(dateFromString.toString(format: self.format), date.toString(format: self.format)) // TODO why is there a need for ! for self.dateString
        XCTAssertNil(Date(fromString: self.invalidDateString, format: format), "Date From String initialized, but source string was invalid.")
        
        let dateFromFalseStr = Date(fromString: "lol", format: "haha")
        XCTAssertNil(dateFromFalseStr)
    }
    
    func testDateFormatterCacheDictionary() {
        let formatter1 = "yyyy-MM-dd"
        let formatter2 = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
        
        let _ = createDateFormatter(for: formatter1)
        let _ = createDateFormatter(for: formatter2)
        
        let size = DateFormattersManager.dateFormatters.getSize()
        XCTAssertEqual(size, 2)
        
        var hasFormatter = DateFormattersManager.dateFormatters.containValue(for: formatter1)
        XCTAssertTrue(hasFormatter)
        
        hasFormatter = DateFormattersManager.dateFormatters.containValue(for: formatter2)
        XCTAssertTrue(hasFormatter)
    }
    
    ///EZSE: CreateDateFormatter if formatter doesn't exist in Dict.
    private func createDateFormatter(for format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        DateFormattersManager.dateFormatters.setValue(for: format, value: formatter)
        return formatter
    }
    
    func testHTTPDateString() {
        // Given
        let fromStartOfDay = TimeInterval(16 * 3600 + 5 * 60 + 11) // seconds from start of day
        let fromStartOfMin = TimeInterval(11) // seconds from start of minute

        // When
        let correctDateString = "2015-11-14"
        let correctTimeString = "16:05:11"
        let correctZoneString = "+00:00"
        
        let rfc1123 = Date(httpDateString: "Sat, 14 Nov 2015 \(correctTimeString) GMT")
        let rfc850 = Date(httpDateString: "Saturday, 14-Nov-15 \(correctTimeString) GMT")
        let asctime = Date(httpDateString: "Sun Nov 14 \(correctTimeString) 2015")
        let iso8601DateOnly = Date(httpDateString: correctDateString)
        let iso8601DateHrMinOnly = Date(httpDateString: "\(correctDateString)T16:05\(correctZoneString)")
        let iso8601DateHrMinSecOnly = Date(httpDateString: "\(correctDateString)T\(correctTimeString)\(correctZoneString)")
        let iso8601DateHrMinSecMs = Date(httpDateString: "\(correctDateString)T\(correctTimeString).123\(correctZoneString)") // random nanosecond value 123
        let invalid = Date(httpDateString: "\(correctDateString) \(correctTimeString)")

        // Test
        XCTAssertEqual(rfc1123, self.date)
        XCTAssertEqual(rfc850, self.date)
        XCTAssertEqual(asctime?.addingTimeInterval(self.timeZoneOffset), self.date)
        XCTAssertEqual(iso8601DateOnly?.addingTimeInterval(self.timeZoneOffset), self.date.addingTimeInterval(-fromStartOfDay))
        XCTAssertEqual(iso8601DateHrMinOnly, self.date.addingTimeInterval(-fromStartOfMin))
        XCTAssertEqual(iso8601DateHrMinSecOnly, self.date)
        XCTAssertEqual(iso8601DateHrMinSecMs, Date(timeIntervalSince1970: 1447517111.123)) // TODO: find method that can add milliseconds to Date object
        XCTAssertNil(invalid)
    }

    func testDateToString() {
        let date = Date(timeIntervalSince1970: 0)
        let format = "yyyy-MM-dd"
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
        XCTAssertEqual(today.timePassed(), "Just now")
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1,to: today)
        XCTAssertEqual(yesterday?.timePassed(), "1 day ago")
        
        let fiveSecondsAgo = Calendar.current.date(byAdding: .second, value: -5,to: today)
        XCTAssertEqual(fiveSecondsAgo?.timePassed(), "5 seconds ago")
        
        let oneSecondAgo = Calendar.current.date(byAdding: .second, value: -1, to: today)
        XCTAssertEqual(oneSecondAgo?.timePassed(), "1 second ago")
        
        let sixHoursAgo = Calendar.current.date(byAdding: .hour, value: -6,to: today)
        XCTAssertEqual(sixHoursAgo?.timePassed(), "6 hours ago")
        
        let twoMonthsAgo = Calendar.current.date(byAdding: .month, value: -2,to: today)
        XCTAssertEqual(twoMonthsAgo?.timePassed(), "2 months ago")
        
        let fifteenYearsAgo = Calendar.current.date(byAdding: .year, value: -15,to: today)
        XCTAssertEqual(fifteenYearsAgo?.timePassed(), "15 years ago")
    }
    
    func testTimePassedEnumBetweenDates() {
        
        let today = Date()
        let timePassedToday: TimePassed = today.timePassed()
        XCTAssertEqual(timePassedToday, TimePassed.now)
        
        let fifteenYearsAgo = Calendar.current.date(byAdding: .year, value: -15, to: today)
        let timePassedFifteenYearsAgo: TimePassed = fifteenYearsAgo!.timePassed()
        XCTAssertEqual(timePassedFifteenYearsAgo, TimePassed.year(15))
        
        let twoMonthsAgo = Calendar.current.date(byAdding: .month, value: -2, to: today)
        let timePassedTwoMonthsAgo: TimePassed = twoMonthsAgo!.timePassed()
        XCTAssertEqual(timePassedTwoMonthsAgo, TimePassed.month(2))
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
        let timePassedYesterday: TimePassed = yesterday!.timePassed()
        XCTAssertEqual(timePassedYesterday, TimePassed.day(1))
        
        let sixHoursAgo = Calendar.current.date(byAdding: .hour, value: -6, to: today)
        let timePassedSixHoursAgo: TimePassed = sixHoursAgo!.timePassed()
        XCTAssertEqual(timePassedSixHoursAgo, TimePassed.hour(6))
        
        let thirteenMinutesAgo = Calendar.current.date(byAdding: .minute, value: -13, to: today)
        let timePassedThirteenMinutesAgo: TimePassed = thirteenMinutesAgo!.timePassed()
        XCTAssertEqual(timePassedThirteenMinutesAgo, TimePassed.minute(13))
        
        let fiveSecondsAgo = Calendar.current.date(byAdding: .second, value: -5, to: today)
        let timePassedFiveSecondsAgo: TimePassed = fiveSecondsAgo!.timePassed()
        XCTAssertEqual(timePassedFiveSecondsAgo, TimePassed.second(5))
        
        let oneSecondAgo = Calendar.current.date(byAdding: .second, value: -1, to: today)
        let timePassedOneSecondAgo: TimePassed = oneSecondAgo!.timePassed()
        XCTAssertEqual(timePassedOneSecondAgo, TimePassed.second(1))
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
        XCTAssertEqual(date.era, Calendar.current.component(Calendar.Component.era, from: date))
    }
    
    func testYear() {
        XCTAssertEqual(self.date.year, 2015)
    }
    
    func testMonth() {
        XCTAssertEqual(self.date.month, 11)
    }
    
    func testMonthAsString() {
        XCTAssertEqual(self.date.monthAsString, "November")
    }
    
    func testWeekDay() {
        XCTAssertEqual(self.date.weekday, "Sunday")
        NSTimeZone.default = TimeZone(abbreviation: "UTC")!
    }
    
    func testDay() {
        XCTAssertEqual(self.date.day, 15)
        NSTimeZone.default = TimeZone(abbreviation: "UTC")!
        XCTAssertEqual(self.date.day, 14)
    }
    
    func testHour() {
        XCTAssertEqual(self.date.hour, 0)
        NSTimeZone.default = TimeZone(abbreviation: "UTC")!
        XCTAssertEqual(self.date.hour, 16)
    }
    
    func testMinute() {
        XCTAssertEqual(self.date.minute, 5)
    }
    
    func testSecond() {
        XCTAssertEqual(self.date.second, 11)
    }
    
    func testNanoSecond() {
        XCTAssertEqual(self.date.nanosecond, 0)
        
        let today = Date()
        XCTAssert(today.nanosecond == Calendar.current.component(.nanosecond, from: today))
    }
    
    #if os(iOS) || os(tvOS)
    
    func testISO8601() {
        XCTAssertEqual(self.date.iso8601, "2015-11-14T16:05:11Z")
    }
    
    #endif
}
