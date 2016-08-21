//
//  NSDateExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension NSDate {
    /// EZSE: Initializes NSDate from string and format
    public convenience init?(fromString string: String, format: String) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        if let date = formatter.dateFromString(string) {
            self.init(timeInterval: 0, sinceDate: date)
        } else {
            self.init()
            return nil
        }
    }

    /// EZSE: Initializes NSDate from string returned from an http response, according to several RFCs
    public convenience init?(httpDateString: String) {
        if let rfc1123 = NSDate(fromString: httpDateString, format: "EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz") {
            self.init(timeInterval: 0, sinceDate: rfc1123)
            return
        }
        if let rfc850 = NSDate(fromString: httpDateString, format: "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z") {
            self.init(timeInterval: 0, sinceDate: rfc850)
            return
        }
        if let asctime =  NSDate(fromString: httpDateString, format: "EEE MMM d HH':'mm':'ss yyyy") {
            self.init(timeInterval: 0, sinceDate: asctime)
            return
        }

        //self.init()
        return nil
    }

    /// EZSE: Converts NSDate to String
    public func toString(dateStyle dateStyle: NSDateFormatterStyle = .MediumStyle, timeStyle: NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.stringFromDate(self)
    }

    /// EZSE: Converts NSDate to String, with format
    public func toString(format format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }

    /// EZSE: Calculates how many days passed from now to date
    public func daysInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }

    /// EZSE: Calculates how many hours passed from now to date
    public func hoursInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }

    /// EZSE: Calculates how many minutes passed from now to date
    public func minutesInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }

    /// EZSE: Calculates how many seconds passed from now to date
    public func secondsInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }

    /// EZSE: Get year from current NSDate
    public var year: Int {
        return getComponent(.Year)
    }

    /// EZSE: Get month from current NSDate
    public var month: Int {
        return getComponent(.Month)
    }

    /// EZSE: Get day from current NSDate
    public var day: Int {
        return getComponent(.Day)
    }

    /// EZSE: Get hour from current NSDate
    public var hours: Int {
        return getComponent(.Hour)
    }

    /// EZSE: Get minute from current NSDate
    public var minutes: Int {
        return getComponent(.Minute)
    }

    /// EZSE: Get second from current NSDate
    public var seconds: Int {
        return getComponent(.Second)
    }

    /// EZSE: Get component of NSDate, e.g. month, year ...
    public func getComponent(component: NSCalendarUnit) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(component, fromDate: self)

        return components.valueForComponent(component)
    }

    /// EZSE: Get Astro from current NSDate
    public var astro: String {
        var s = ["Capricorn",
                 "Aquarius",
                 "Pisces",
                 "Aries",
                 "Taurus",
                 "Gemini",
                 "Cancer",
                 "Leo",
                 "Virgo",
                 "Libra",
                 "Scorpio",
                 "Sagittarius",
                 "Capricorn"]
        var arr = [20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22]
        let index = month - (day < (arr[month-1]) ? 1 : 0)
        return s[index]
    }

    /// EZSE: Check date if it is today
    public var isToday: Bool {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.stringFromDate(self) == format.stringFromDate(NSDate())
    }

    /// EZSE: Check date if it is yesterday
    public var isYesterday: Bool {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.stringFromDate(self) == format.stringFromDate(NSDate().dateByAddingTimeInterval(-24*60*60))
    }

    /// EZSE: Return a favored string for noticing time depending on current date
    public func noticeTime() -> String {
        let format = NSDateFormatter()
        if self.isToday {
            format.dateFormat = "HH:mm"
        } else if self.isYesterday {
            format.dateFormat = "Yesterday HH:mm"
        } else {
            format.dateFormat = "MM-dd"
        }
        return format.stringFromDate(self)
    }

    /// EZSE: Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
    public func timePassed() -> String {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self, toDate: date, options: [])
        var str: String

        if components.year >= 1 {
            components.year == 1 ? (str = "year") : (str = "years")
            return "\(components.year) \(str) ago"
        } else if components.month >= 1 {
            components.month == 1 ? (str = "month") : (str = "months")
            return "\(components.month) \(str) ago"
        } else if components.day >= 1 {
            components.day == 1 ? (str = "day") : (str = "days")
            return "\(components.day) \(str) ago"
        } else if components.hour >= 1 {
            components.hour == 1 ? (str = "hour") : (str = "hours")
            return "\(components.hour) \(str) ago"
        } else if components.minute >= 1 {
            components.minute == 1 ? (str = "minute") : (str = "minutes")
            return "\(components.minute) \(str) ago"
        } else if components.second == 0 {
            return "Just now"
        } else {
            return "\(components.second) seconds ago"
        }
    }

    /// EZSE: Easy creation of time passed String; similar to timePassed but with shorter string
    public func timePassedShort() -> String {
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [.Minute, .Hour, .Day, .WeekOfYear, .Month, .Year, .Second]
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now) ? self: now
        let components: NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: [])

        if components.year >= 2 {
            return "\(components.year)y"
        } else if components.year >= 1 {
            return "1y"
        } else if components.month >= 2 {
            return "\(components.month * 4)w"
        } else if components.month >= 1 {
            return "4w"
        } else if components.weekOfYear >= 2 {
            return "\(components.weekOfYear)w"
        } else if components.weekOfYear >= 1 {
            return "1w"
        } else if components.day >= 2 {
            return "\(components.day)d"
        } else if components.day >= 1 {
            return "1d"
        } else if components.hour >= 2 {
            return "\(components.hour)h"
        } else if components.hour >= 1 {
            return "1h"
        } else if components.minute >= 2 {
            return "\(components.minute)m"
        } else if components.minute >= 1 {
            return "1m"
        } else if components.second >= 3 {
            return "\(components.second)s"
        } else {
            return "now"
        }
    }

    /// EZSE: Class method for converting timestamp to NSDate
    public class func dateFromTimestampString(timestamp: String) -> NSDate! {
        let time = Int(timestamp)!
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(time))
        return date
    }

}

extension NSDate: Comparable {}
/// EZSE: Returns if dates are equal to each other
public func == (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.isEqualToDate(rhs)
}
/// EZSE: Returns if left date is earlier than the right one
public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}
/// EZSE: Returns if left date is later than the right one
public func > (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedDescending
}
