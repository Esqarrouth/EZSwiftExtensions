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
    
    /// EZSE: Returns the index of the object
    public func indexOfObject<T: Equatable>(object: T) -> Int? {
        for index in 0..<self.count {
            if let arrayObject = self[index] as? T {
                if arrayObject == object {
                    return index
                }
            }
        }

        return nil
    }

    /// EZSE: Removes the last given object
    public mutating func removeObject<U: Equatable>(object: U) {
        for i in (0..<count).reverse() {
            if let obj = self[i] as? U where obj == object {
                self.removeAtIndex(i)
                return
            }
        }
    }
    
    /// EZSE: Removes all occurrences of the given object
    public mutating func removeObjects<U: Equatable>(object: U) {
        for i in (0..<count).reverse() {
            if let obj = self[i] as? U where obj == object {
                self.removeAtIndex(i)
            }
        }        
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

