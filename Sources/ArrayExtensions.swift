//
//  ArrayExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Array {

    /// EZSE: Returns a random element from the array.
    public func random() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    /// EZSE: Checks if array contains at least 1 instance of the given object type
    public func containsInstanceOf<T>(object: T) -> Bool {
        for item in self {
            if item.dynamicType == object.dynamicType {
                return true
            }
        }
        return false
    }
}

extension Array where Element : Equatable {

    /// EZSE: Returns the indexs of the object
    public func indexsOf(object: Element) -> [Int] {
        var indexs = [Int]()
        for index in 0..<self.count {
            if self[index] == object {
                indexs.append(index)
            }
        }
        
        return indexs
    }
    
    /// EZSE: Removes the first given object
    public mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
    
    /// EZSE: Removes all occurrences of the given object
    public mutating func removeObjects(object: Element) {
        for i in self.indexsOf(object).reverse() {
            self.removeAtIndex(i)
        }
    }

    /// EZSE: Checks if the main array contains the parameter array
    public func containsArray(lookFor: [Element]) -> Bool {
        for item in lookFor {
            if self.contains(item) == false {
                return false
            }
        }
        return true
    }
}

