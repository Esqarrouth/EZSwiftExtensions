//
//  StringExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension String {
    
    /// EZSwiftExtensions
    subscript(integerIndex: Int) -> Character {
        let index = startIndex.advancedBy(integerIndex)
        return self[index]
    }
    
    /// EZSwiftExtensions
    subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
    
    /// EZSwiftExtensions - Character count
    var length: Int {
        return self.characters.count
    }

    /// EZSwiftExtensions
    var capitalizeFirst: String {
        var result = self
        result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
        return result
    }
    
    /// EZSwiftExtensions - Counts whitespace & new lines
    func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let newText = self.stringByTrimmingCharactersInSet(characterSet)
        return newText.isEmpty
    }
    
    /// EZSwiftExtensions - Trims white space and new line characters
    mutating func trim() {
         self = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /// EZSwiftExtensions
    var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        let firstMatch = dataDetector?.firstMatchInString(self, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.URL?.scheme == "mailto")
    }
    
    /// EZSwiftExtensions
    var extractURLs: [NSURL] {
        var urls : [NSURL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        } catch _ as NSError {
            detector = nil
        }

        let text = self
        
        detector!.enumerateMatchesInString(text, options: [], range: NSMakeRange(0, text.characters.count), usingBlock: {
            (result: NSTextCheckingResult?, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            urls.append(result!.URL!)
        })
        
        return urls
    }
    
    /// EZSwiftExtensions
    func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }
    
    /// EZSwiftExtensions
    func contains(find: String, compareOption: NSStringCompareOptions) -> Bool {
        return self.rangeOfString(find, options: compareOption) != nil
    }
    
    /// EZSwiftExtensions
    func toInt() -> Int? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.integerValue
        } else {
            return nil
        }
    }
    
    /// EZSwiftExtensions
    func toDouble() -> Double? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// EZSwiftExtensions
    func toFloat() -> Float? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
}

