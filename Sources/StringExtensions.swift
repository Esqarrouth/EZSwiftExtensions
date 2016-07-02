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
        let pad = String(repeating: Character("="),count: base64.length % 4)
        let base64Padded = base64 + pad
        if let decodedData = Data(base64Encoded: base64Padded, options: .encoding64CharacterLineLength), let decodedString = NSString(data: decodedData, encoding: String.Encoding.utf8.rawValue) {
            self.init(decodedString)
            return
        }
        return nil
    }

    /// EZSE: base64 encoded of string
    var base64: String {
        get {
            let plainData = (self as NSString).data(using: String.Encoding.utf8.rawValue)
            let base64String = plainData!.base64EncodedString(NSData.Base64EncodingOptions(rawValue: 0))
            return base64String
        }
    }

    /// EZSE: Cut string from integerIndex to the end
    public subscript(integerIndex: Int) -> Character {
        let index = characters.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }

    /// EZSE: Cut string from range
    public subscript(integerRange: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: integerRange.lowerBound)
        let end = characters.index(startIndex, offsetBy: integerRange.upperBound)
        let range = start..<end
        return self[range]
    }

    /// EZSE: Character count
    public var length: Int {
        return self.characters.count
    }

    /// EZSE: Counts number of instances of the input inside String
    public func count(_ substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }

    /// EZSE: Capitalizes first character of String
    public var capitalizeFirst: String {
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
        return result
    }

    /// EZSE: Counts whitespace & new lines
    public func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = CharacterSet.whitespacesAndNewlines
        let newText = self.trimmingCharacters(in: characterSet)
        return newText.isEmpty
    }

    /// EZSE: Trims white space and new line characters
    public mutating func trim() {
         self = self.trimmed()
    }

    /// EZSE: Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    /// EZSE: Position of begining character of substing
    public func positionOfSubstring(_ subString: String, caseInsensitive: Bool = false, fromEnd: Bool = false) -> Int {
        if subString.isEmpty {
            return -1
        }
        var searchOption = fromEnd ? NSString.CompareOptions.anchoredSearch : NSString.CompareOptions.backwardsSearch
        if caseInsensitive {
            searchOption.insert(NSString.CompareOptions.caseInsensitiveSearch)
        }
        if let range = self.range(of: subString, options: searchOption) where !range.isEmpty {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        }
        return -1;
    }

    /// EZSE: split string using a spearator string, returns an array of string
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator).filter {
            !$0.trimmed().isEmpty
        }
    }

    /// EZSE: split string with delimiters, returns an array of string
    public func split(_ characters: CharacterSet) -> [String] {
        return self.components(separatedBy: characters).filter {
            !$0.trimmed().isEmpty
        }
    }

    /// EZSE : Returns count of words in string
    public var countofWords: Int {
        let regex = try? RegularExpression(pattern: "\\w+", options: RegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: RegularExpression.MatchingOptions(), range: NSMakeRange(0, self.length)) ?? 0
    }

    /// EZSE : Returns count of paragraphs in string
    public var countofParagraphs: Int {
        let regex = try? RegularExpression(pattern: "\\n", options: RegularExpression.Options())
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return (regex?.numberOfMatches(in: str, options: RegularExpression.MatchingOptions(), range: NSMakeRange(0, str.length)) ?? -1) + 1
    }

    internal func rangeFromNSRange(_ nsRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(n: nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }

    /// EZSE: Find matches of regular expression in string
    public func matchesForRegexInText(_ regex: String!) -> [String] {
        let regex = try? RegularExpression(pattern: regex, options: [])
        let results = regex?.matches(in: self, options: [], range: NSMakeRange(0, self.length)) ?? []
        return results.map { self.substring(with: self.rangeFromNSRange($0.range)!) }
    }

    /// EZSE: Checks if String contains Email
    public var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: TextCheckingResult.CheckingType.link.rawValue)
        let firstMatch = dataDetector?.firstMatch(in: self, options: RegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
    }

    /// EZSE: Returns if String is a number
    public func isNumber() -> Bool {
        if let _ = NumberFormatter().number(from: self) {
            return true
        }
        return false
    }

    /// EZSE: Extracts URLS from String
    public var extractURLs: [URL] {
        var urls: [URL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: TextCheckingResult.CheckingType.link.rawValue)
        } catch _ as NSError {
            detector = nil
        }

        let text = self

        if let detector = detector {
            detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.characters.count), using: {
                (result: TextCheckingResult?, flags: RegularExpression.MatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if let result = result, url = result.url {
                    urls.append(url)
                }
            })
        }

        return urls
    }

    /// EZSE: Checking if String contains input
    public func contains(_ find: String) -> Bool {
        return self.range(of: find) != nil
    }

    /// EZSE: Checking if String contains input with comparing options
    public func contains(_ find: String, compareOption: NSString.CompareOptions) -> Bool {
        return self.range(of: find, options: compareOption) != nil
    }

    /// EZSE: Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }

    /// EZSE: Converts String to Bool
    public func toBool() -> Bool? {
        let trimmed = self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines()).lowercased()
        if trimmed == "true" || trimmed == "false" {
            return (trimmed as NSString).boolValue
        }
        return nil
    }

    ///EZSE: Returns the first index of the occurency of the character in String
    public func getIndexOf(_ char: Character) -> Int? {
        for (index, c) in characters.enumerated() {
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
    public func bold() -> AttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize())])
        return boldString
    }
    
    #endif

    ///EZSE: Returns underlined NSAttributedString
    public func underline() -> AttributedString {
        let underlineString = AttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        return underlineString
    }
    
    #if os(iOS)

    ///EZSE: Returns italic NSAttributedString
    public func italic() -> AttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize())])
        return italicString
    }
    
    #endif

    #if os(iOS)

    ///EZSE: Returns hight of rendered string
    func height(_ width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle();
            paragraphStyle.lineBreakMode = lineBreakMode!;
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName);
        }
        let size = CGSize(width: width, height: CGFloat(DBL_MAX));
        return ceil((self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }
    
    #endif

    ///EZSE: Returns NSAttributedString
    public func color(_ color: UIColor) -> AttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
        return colorString
    }

    ///EZSE: Returns NSAttributedString
    public func colorSubString(_ subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0;
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).range(of: subString, options: NSString.CompareOptions.literalSearch, range: NSMakeRange(start, (self as NSString).length - start))
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
            let c: unichar = (self as NSString).character(at: i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }
}

/// EZSE: Pattern matching of strings via defined functions
public func ~=<T>(pattern: ((T) -> Bool), value: T) -> Bool {
    return pattern(value)
}

/// EZSE: Can be used in switch-case
public func hasPrefix(_ prefix: String) -> (value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasPrefix(prefix)
    }
}

/// EZSE: Can be used in switch-case
public func hasSuffix(_ suffix: String) -> (value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasSuffix(suffix)
    }
}
