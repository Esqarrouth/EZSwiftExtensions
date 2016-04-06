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
            return nil
        }
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

}

extension NSDate: Comparable {}
 /// EZSE: Returns if dates are equal to each other
public func == (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.isEqualToDate(rhs)
}
 /// EZSE: Returns if one date is smaller than the other
public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedDescending
}
