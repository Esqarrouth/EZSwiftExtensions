//
//  NSDateExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension NSDate {
    
    /// EZSwiftExtensions
    public func toString() -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.NoStyle
        formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        return formatter.stringFromDate(self)
    }
    
    //TODO: add in readme
    /// EZSwiftExtensions
    public func fromString(format: String, string: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(string)
    }
    
    /// EZSwiftExtensions
    public func daysInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }
    
    /// EZSwiftExtensions
    public func hoursInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }
    
    /// EZSwiftExtensions
    public func minutesInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }
    
    /// EZSwiftExtensions
    public func secondsInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
    
    /// EZSwiftExtensions
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

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}


