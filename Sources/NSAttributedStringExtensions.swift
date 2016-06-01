//
//  NSAttributedStringExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 18/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//
import UIKit

extension NSAttributedString {
    /// EZSE: Adds bold attribute to NSAttributedString and returns it
    
    #if os(iOS)
    
    public func bold() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())], range: range)
        return copy
    }
    
    #endif

    /// EZSE: Adds underline attribute to NSAttributedString and returns it
    public func underline() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue], range: range)
        return copy
    }
    
    #if os(iOS)

    /// EZSE: Adds italic attribute to NSAttributedString and returns it
    public func italic() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.italicSystemFontOfSize(UIFont.systemFontSize())], range: range)
        return copy
    }
    
    /// EZSE: Adds strikethrough attribute to NSAttributedString and returns it
    public func strikethrough() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
    
        let range = (self.string as NSString).rangeOfString(self.string)
        let attributes = [
        NSStrikethroughStyleAttributeName: NSNumber(integer: NSUnderlineStyle.StyleSingle.rawValue)]
        copy.addAttributes(attributes, range: range)
      
        return copy
    }

    
    #endif

    /// EZSE: Adds color attribute to NSAttributedString and returns it
    public func color(color: UIColor) -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSForegroundColorAttributeName: color], range: range)
        return copy
    }
}

/// EZSE: Appends one NSAttributedString to another NSAttributedString and returns it
public func += (inout left: NSAttributedString, right: NSAttributedString) {
    let ns = NSMutableAttributedString(attributedString: left)
    ns.appendAttributedString(right)
    left = ns
}
