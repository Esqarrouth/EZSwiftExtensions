//
//  NSDateExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Date {
    /// EZSE: Initializes Date from string and format
    public init?(fromString string: String, format: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self = type(of: date as NSDate).init(timeInterval: 0, since: date) as Date
        } else {
            return nil
        }
    }

    /// EZSE: Initializes Date from string returned from an http response, according to several RFCs
    public init? (httpDateString: String) {
        if let rfc1123 = Date(fromString: httpDateString, format: "EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz") {
            self = type(of: rfc1123 as NSDate).init(timeInterval: 0, since: rfc1123) as Date
            return
        }
        if let rfc850 = Date(fromString: httpDateString, format: "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z") {
            self = type(of: rfc850 as NSDate).init(timeInterval: 0, since: rfc850) as Date
            return
        }
        if let asctime =  Date(fromString: httpDateString, format: "EEE MMM d HH':'mm':'ss yyyy") {
            self = type(of: asctime as NSDate).init(timeInterval: 0, since: asctime) as Date
            return
        }
        //self.init()
        return nil
    }

    /// EZSE: Converts NSDate to String
    public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }

    /// EZSE: Converts NSDate to String, with format
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// EZSE: Calculates how many days passed from now to date
    public func daysInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }

    /// EZSE: Calculates how many hours passed from now to date
    public func hoursInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }

    /// EZSE: Calculates how many minutes passed from now to date
    public func minutesInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }

    /// EZSE: Calculates how many seconds passed from now to date
    public func secondsInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }

    /// EZSE: Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
    public func timePassed() -> String {
        let date = Date()
        let calendar = Calendar.current
        let calendarComponent: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let components = calendar.dateComponents(calendarComponent, from: self, to: date)
        var str: String

        if components.year! >= 1 {
            components.year == 1 ? (str = "year") : (str = "years")
            return "\(components.year) \(str) ago"
        } else if components.month! >= 1 {
            components.month == 1 ? (str = "month") : (str = "months")
            return "\(components.month) \(str) ago"
        } else if components.day! >= 1 {
            components.day == 1 ? (str = "day") : (str = "days")
            return "\(components.day) \(str) ago"
        } else if components.hour! >= 1 {
            components.hour == 1 ? (str = "hour") : (str = "hours")
            return "\(components.hour) \(str) ago"
        } else if components.minute! >= 1 {
            components.minute == 1 ? (str = "minute") : (str = "minutes")
            return "\(components.minute) \(str) ago"
        } else if components.second == 0 {
            return "Just now"
        } else {
            return "\(components.second) seconds ago"
        }
    }

}

 /// EZSE: Returns if dates are equal to each other
//public func == (lhs: Date, rhs: Date) -> Bool {
//  return (lhs == rhs)
//}
 /// EZSE: Returns if one date is smaller than the other
public func < (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}

public func > (lhs: Date, rhs: Date) -> Bool {
  return lhs.compare(rhs) == .orderedDescending
}
