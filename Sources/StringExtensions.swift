//
//  StringExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
#if os(OSX)
import AppKit
#else
import UIKit
#endif

extension String {
    /// EZSE: Init string with a base64 encoded string
    init ? (base64: String) {
        let pad = String(count: base64.length % 4,repeatedValue: Character("="))
        let base64Padded = base64 + pad
        if let decodedData = NSData(base64EncodedString: base64Padded, options: NSDataBase64DecodingOptions(rawValue: 0)), let decodedString = NSString(data: decodedData, encoding: NSUTF8StringEncoding) {
            self.init(decodedString)
            return
        }
        return nil
    }

    /// EZSE: base64 encoded of string
    var base64: String {
        get {
            let plainData = (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            let base64String = plainData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
            return base64String
        }
    }

    /// EZSE: Cut string from integerIndex to the end
    public subscript(integerIndex: Int) -> Character {
        let index = startIndex.advancedBy(integerIndex)
        return self[index]
    }

    /// EZSE: Cut string from range
    public subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }

    /// EZSE: Character count
    public var length: Int {
        return self.characters.count
    }

    /// EZSE: Counts number of instances of the input inside String
    public func count(substring: String) -> Int {
        return componentsSeparatedByString(substring).count - 1
    }

    /// EZSE: Capitalizes first character of String
    public var capitalizeFirst: String {
    
        guard characters.count > 0 else { return self }
        var result = self
        
        result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
        return result
    }

    /// EZSE: Counts whitespace & new lines
    public func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let newText = self.stringByTrimmingCharactersInSet(characterSet)
        return newText.isEmpty
    }

    /// EZSE: Trims white space and new line characters
    public mutating func trim() {
         self = self.trimmed()
    }

    /// EZSE: Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    /// EZSE: Position of begining character of substing
    public func positionOfSubstring(subString: String, caseInsensitive: Bool = false, fromEnd: Bool = false) -> Int {
        if subString.isEmpty {
            return -1
        }
        var searchOption = fromEnd ? NSStringCompareOptions.AnchoredSearch : NSStringCompareOptions.BackwardsSearch
        if caseInsensitive {
            searchOption.insert(NSStringCompareOptions.CaseInsensitiveSearch)
        }
        if let range = self.rangeOfString(subString, options: searchOption) where !range.isEmpty {
            return self.startIndex.distanceTo(range.startIndex)
        }
        return -1;
    }

    /// EZSE: split string using a spearator string, returns an array of string
    public func split(separator: String) -> [String] {
        return self.componentsSeparatedByString(separator).filter {
            !$0.trimmed().isEmpty
        }
    }

    /// EZSE: split string with delimiters, returns an array of string
    public func split(characters: NSCharacterSet) -> [String] {
        return self.componentsSeparatedByCharactersInSet(characters).filter {
            !$0.trimmed().isEmpty
        }
    }

    /// EZSE : Returns count of words in string
    public var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpressionOptions())
        return regex?.numberOfMatchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, self.length)) ?? 0
    }

    /// EZSE : Returns count of paragraphs in string
    public var countofParagraphs: Int {
        let regex = try? NSRegularExpression(pattern: "\\n", options: NSRegularExpressionOptions())
        let str = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return (regex?.numberOfMatchesInString(str, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)) ?? -1) + 1
    }

    internal func rangeFromNSRange(nsRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }

    /// EZSE: Find matches of regular expression in string
    public func matchesForRegexInText(regex: String!) -> [String] {
        let regex = try? NSRegularExpression(pattern: regex, options: [])
        let results = regex?.matchesInString(self, options: [], range: NSMakeRange(0, self.length)) ?? []
        return results.map { self.substringWithRange(self.rangeFromNSRange($0.range)!) }
    }

    /// EZSE: Checks if String contains Email
    public var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        let firstMatch = dataDetector?.firstMatchInString(self, options: NSMatchingOptions.ReportCompletion, range: NSRange(location: 0, length: length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.URL?.scheme == "mailto")
    }

    /// EZSE: Returns if String is a number
    public func isNumber() -> Bool {
        if let _ = NSNumberFormatter().numberFromString(self) {
            return true
        }
        return false
    }

    /// EZSE: Extracts URLS from String
    public var extractURLs: [NSURL] {
        var urls: [NSURL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        } catch _ as NSError {
            detector = nil
        }

        let text = self

        if let detector = detector {
            detector.enumerateMatchesInString(text, options: [], range: NSRange(location: 0, length: text.characters.count), usingBlock: {
                (result: NSTextCheckingResult?, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if let result = result, url = result.URL {
                    urls.append(url)
                }
            })
        }

        return urls
    }

    /// EZSE: Checking if String contains input
    public func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }

    /// EZSE: Checking if String contains input with comparing options
    public func contains(find: String, compareOption: NSStringCompareOptions) -> Bool {
        return self.rangeOfString(find, options: compareOption) != nil
    }

    /// EZSE: Converts String to Int
    public func toInt() -> Int? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.integerValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Double
    public func toDouble() -> Double? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.doubleValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.floatValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Bool
    public func toBool() -> Bool? {
        let trimmed = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).lowercaseString
        if trimmed == "true" || trimmed == "false" {
            return (trimmed as NSString).boolValue
        }
        return nil
    }

    ///EZSE: Returns the first index of the occurency of the character in String
    public func getIndexOf(char: Character) -> Int? {
        for (index, c) in characters.enumerate() {
            if c == char {
                return index
            }
        }
        return nil
    }

    /// EZSE: Converts String to NSString
    public var toNSString: NSString { get { return self as NSString } }

    #if os(iOS)
    
    ///EZSE: Returns bold NSAttributedString
    public func bold() -> NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())])
        return boldString
    }
    
    #endif

    ///EZSE: Returns underlined NSAttributedString
    public func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
        return underlineString
    }
    
    #if os(iOS)

    ///EZSE: Returns italic NSAttributedString
    public func italic() -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFontOfSize(UIFont.systemFontSize())])
        return italicString
    }
    
    #endif

    #if os(iOS)

    ///EZSE: Returns hight of rendered string
    func height(width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle();
            paragraphStyle.lineBreakMode = lineBreakMode!;
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName);
        }
        let size = CGSize(width: width, height: CGFloat(DBL_MAX));
        return ceil((self as NSString).boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }
    
    #endif

    ///EZSE: Returns NSAttributedString
    public func color(color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
        return colorString
    }

    ///EZSE: Returns NSAttributedString
    public func colorSubString(subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0;
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).rangeOfString(subString, options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(start, (self as NSString).length - start))
            if range.location == NSNotFound {
                break;
            } else {
                ranges.append(range)
                start = range.location + range.length
            }
        }
        let attrText = NSMutableAttributedString(string: self);
        for range in ranges {
            attrText.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        }
        return attrText;
    }

    /// EZSE: Checks if String contains Emoji
    public func includesEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).characterAtIndex(i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }
}

/// EZSE: Pattern matching of strings via defined functions
public func ~=<T>(pattern: (T -> Bool), value: T) -> Bool {
    return pattern(value)
}

/// EZSE: Can be used in switch-case
public func hasPrefix(prefix: String) -> (value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasPrefix(prefix)
    }
}

/// EZSE: Can be used in switch-case
public func hasSuffix(suffix: String) -> (value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasSuffix(suffix)
    }
}
