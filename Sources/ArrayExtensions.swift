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
    public func random() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    /// EZSwiftExtensions
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

    /// EZSwiftExtensions
    public mutating func removeObject<U: Equatable>(object: U) {
        for i in (0..<count).reverse() {
            if let obj = self[i] as? U where obj == object {
                self.removeAtIndex(i)
            }
        }
    }
}

