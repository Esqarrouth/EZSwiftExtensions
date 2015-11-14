//
//  ArrayExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Array {
    
    /// EZSwiftExtensions
    func random() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    /// EZSwiftExtensions
    func indexOfObject<T: Equatable>(object: T) -> Int? {
        for index in 0..<self.count {
            if let arrayObject = self[index] as? T {
                if arrayObject == object {
                    return index
                }
            }
        }
        
        return nil
    }

    /// EZSwiftExtensions
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if index != nil {
            self.removeAtIndex(index!)
        }
    }
}

