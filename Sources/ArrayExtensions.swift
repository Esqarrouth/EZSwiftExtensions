//
//  ArrayExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

public func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}

extension Array {

    ///EZSE: Get a sub array from range of index
    public func get(at range: ClosedRange<Int>) -> Array {
        let halfOpenClampedRange = Range(range).clamped(to: Range(indices))
        return Array(self[halfOpenClampedRange])
    }

    /// EZSE: Checks if array contains at least 1 item which type is same with given element's type
    public func containsType<T>(of element: T) -> Bool {
        let elementType = type(of: element)
        return contains { type(of: $0) == elementType}
    }

    /// EZSE: Decompose an array to a tuple with first element and the rest
    public func decompose() -> (head: Iterator.Element, tail: SubSequence)? {
        return (count > 0) ? (self[0], self[1..<count]) : nil
    }

    /// EZSE: Iterates on each element of the array with its index. (Index, Element)
    public func forEachEnumerated(_ body: @escaping (_ offset: Int, _ element: Element) -> Void) {
        enumerated().forEach(body)
    }

    /// EZSE: Gets the object at the specified index, if it exists.
    public func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }

    /// EZSE: Prepends an object to the array.
    public mutating func insertFirst(_ newElement: Element) {
        insert(newElement, at: 0)
    }

    /// EZSE: Returns a random element from the array.
    public func random() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }

    /// EZSE: Reverse the given index. i.g.: reverseIndex(2) would be 2 to the last
    public func reverseIndex(_ index: Int) -> Int? {
        guard index >= 0 && index < count else { return nil }
        return Swift.max(count - 1 - index, 0)
    }

    /// EZSE: Shuffles the array in-place using the Fisher-Yates-Durstenfeld algorithm.
    public mutating func shuffle() {
        guard count > 1 else { return }
        var j: Int
        for i in 0..<(count-2) {
            j = Int(arc4random_uniform(UInt32(count - i)))
            if i != i+j { swap(&self[i], &self[i+j]) }
        }
    }

    /// EZSE: Shuffles copied array using the Fisher-Yates-Durstenfeld algorithm, returns shuffled array.
    public func shuffled() -> Array {
        var result = self
        result.shuffle()
        return result
    }

    /// EZSE: Returns an array with the given number as the max number of elements.
    public func takeMax(_ n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }

    /// EZSE: Checks if test returns true for all the elements in self
    public func testAll(_ body: @escaping (Element) -> Bool) -> Bool {
        return !contains { !body($0) }
    }

    /// EZSE: Checks if all elements in the array are true or false
    public func testAll(is condition: Bool) -> Bool {
        return testAll { ($0 as? Bool) ?? !condition == condition }
    }
}

extension Array where Element: Equatable {

    /// EZSE: Checks if the main array contains the parameter array
    public func contains(_ array: [Element]) -> Bool {
        return array.testAll { self.index(of: $0) ?? -1 >= 0 }
    }

    /// EZSE: Checks if self contains a list of items.
    public func contains(_ elements: Element...) -> Bool {
        return elements.testAll { self.index(of: $0) ?? -1 >= 0 }
    }

    /// EZSE: Returns the indexes of the object
    public func indexes(of element: Element) -> [Int] {
        return enumerated().flatMap { ($0.element == element) ? $0.offset : nil }
    }

    /// EZSE: Returns the last index of the object
    public func lastIndex(of element: Element) -> Int? {
        return indexes(of: element).last
    }

    /// EZSE: Removes the first given object
    public mutating func removeFirst(_ element: Element) {
        guard let index = index(of: element) else { return }
        self.remove(at: index)
    }

    /// EZSE: Removes all occurrences of the given object(s)
    public mutating func removeAll(_ elements: Element...) {
        removeAll(elements)
    }

    /// EZSE: Removes all occurrences of the given object(s)
    public mutating func removeAll(_ elements: [Element]) {
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elements.contains($0) }
    }

    /// EZSE: Difference of self and the input arrays.
    public func difference(_ values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                //  if a value is in both self and one of the values arrays
                //  jump to the next iteration of the outer loop
                if value.contains(element) {
                    continue elements
                }
            }
            //  element it's only in self
            result.append(element)
        }
        return result
    }

    /// EZSE: Intersection of self and the input arrays.
    public func intersection(_ values: [Element]...) -> Array {
        var result = self
        var intersection = Array()

        for (i, value) in values.enumerated() {
            //  the intersection is computed by intersecting a couple per loop:
            //  self n values[0], (self n values[0]) n values[1], ...
            if i > 0 {
                result = intersection
                intersection = Array()
            }

            //  find common elements and save them in first set
            //  to intersect in the next loop
            value.forEach { (item: Element) -> Void in
                if result.contains(item) {
                    intersection.append(item)
                }
            }
        }
        return intersection
    }

    /// EZSE: Union of self and the input arrays.
    public func union(_ values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }

    /// EZSE: Returns an array consisting of the unique elements in the array
    public func unique() -> Array {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}

extension Array where Element: Hashable {

    /// EZSE: Removes all occurrences of the given object(s)
    public mutating func removeAll(_ elements: [Element]) {
        let elementsSet = Set(elements)
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elementsSet.contains($0) }
    }
}

// MARK: - Deprecated 1.8

extension Array {

    /// EZSE: Checks if array contains at least 1 instance of the given object type
    @available(*, deprecated: 1.8, renamed: "containsType(of:)")
    public func containsInstanceOf<T>(_ element: T) -> Bool {
        return containsType(of: element)
    }

    /// EZSE: Gets the object at the specified index, if it exists.
    @available(*, deprecated: 1.8, renamed: "get(at:)")
    public func get(_ index: Int) -> Element? {
        return get(at: index)
    }

    /// EZSE: Checks if all elements in the array are true of false
    @available(*, deprecated: 1.8, renamed: "testAll(is:)")
    public func testIfAllIs(_ condition: Bool) -> Bool {
        return testAll(is: condition)
    }

}

extension Array where Element: Equatable {

    /// EZSE: Removes the first given object
    @available(*, deprecated: 1.8, renamed: "removeFirst(_:)")
    public mutating func removeFirstObject(_ object: Element) {
        removeFirst(object)
    }
}

// MARK: - Deprecated 1.7

extension Array {

    /// EZSE: Prepends an object to the array.
    @available(*, deprecated: 1.7, renamed: "insertFirst(_:)")
    public mutating func insertAsFirst(_ newElement: Element) {
        insertFirst(newElement)
    }

}

extension Array where Element: Equatable {

    /// EZSE: Checks if the main array contains the parameter array
    @available(*, deprecated: 1.7, renamed: "contains(_:)")
    public func containsArray(_ array: [Element]) -> Bool {
        return contains(array)
    }

    /// EZSE: Returns the indexes of the object
    @available(*, deprecated: 1.7, renamed: "indexes(of:)")
    public func indexesOf(_ object: Element) -> [Int] {
        return indexes(of: object)
    }

    /// EZSE: Returns the last index of the object
    @available(*, deprecated: 1.7, renamed: "lastIndex(_:)")
    public func lastIndexOf(_ object: Element) -> Int? {
        return lastIndex(of: object)
    }

    /// EZSE: Removes the first given object
    @available(*, deprecated: 1.7, renamed: "removeFirstObject(_:)")
    public mutating func removeObject(_ object: Element) {
        removeFirstObject(object)
    }

}

// MARK: - Deprecated 1.6

extension Array {

    /// EZSE: Creates an array with values generated by running each value of self
    /// through the mapFunction and discarding nil return values.
    @available(*, deprecated: 1.6, renamed: "flatMap(_:)")
    public func mapFilter<V>(mapFunction map: (Element) -> (V)?) -> [V] {
        return flatMap { map($0) }
    }

    /// EZSE: Iterates on each element of the array with its index.  (Index, Element)
    @available(*, deprecated: 1.6, renamed: "forEachEnumerated(_:)")
    public func each(_ call: @escaping (Int, Element) -> Void) {
        forEachEnumerated(call)
    }

}
