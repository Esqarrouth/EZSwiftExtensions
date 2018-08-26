//
//  TimePassed.swift
//  EZSwiftExtensions
//
//  Created by Jaja Yting on 24/08/2018.
//  Copyright © 2018 Goktug Yilmaz. All rights reserved.
//

import Foundation

public enum TimePassed {
    
    case year(Int)
    case month(Int)
    case day(Int)
    case hour(Int)
    case minute(Int)
    case second(Int)
    case now
}

extension TimePassed: Equatable {
    
    public static func ==(lhs: TimePassed, rhs: TimePassed) -> Bool {
        
        switch(lhs, rhs) {
            
        case (.year(let a), .year(let b)):
            return a == b
            
        case (.month(let a), .month(let b)):
            return a == b
            
        case (.day(let a), .day(let b)):
            return a == b
            
        case (.hour(let a), .hour(let b)):
            return a == b
            
        case (.minute(let a), .minute(let b)):
            return a == b
            
        case (.second(let a), .second(let b)):
            return a == b
            
        case (.now, .now):
            return true
            
        default:
            return false
        }
    }
}
