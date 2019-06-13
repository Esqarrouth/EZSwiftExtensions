//
//  CharacterExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 3/1/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension Character {
    /// EZSE: Converts Character to String //TODO: Add to readme
    public var toString: String { return String(self) }

    /// EZSE: If the character represents an integer that fits into an Int, returns the corresponding integer.
    ///TODO: Add to readme
    public var toInt: Int? { return Int(String(self)) }

    /// EZSE: Convert the character to lowercase
    public var lowercased: Character {
            let s = String(self).lowercased()
            return s[s.startIndex]
    }

    /// EZSE: Convert the character to uppercase
    public var uppercased: Character {
            let s = String(self).uppercased()
            return s[s.startIndex]
    }
    
    /// EZSE : Checks if character is emoji
    var isEmoji: Bool {
        let utf16s =  String(self).utf16
        let fs = Int(utf16s.first!)
        if 0xD800 <= fs && fs <= 0xDBFF{
            if utf16s.count > 1 {
                let ls = Int(utf16s.last!)
                let uc = (fs-0xD800)*0x400 + (ls - 0xdc00) + 0x10000
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    return true
                }
            }
        }else if(utf16s.count > 1) {
            let ls = Int(utf16s.last!)
            if ls == 0x20E3 {
                return true
            }
        }else{
            if (0x2100 <= fs && fs <= 0x27FF) {
                return true
            } else if (0x2B05 <= fs && fs <= 0x2b07) {
                return true
            } else if (0x2934 <= fs && fs <= 0x2935) {
                return true
            } else if (0x3297 <= fs && fs <= 0x3299) {
                return true
            } else if (fs == 0xa9 || fs == 0xae || fs == 0x303d || fs == 0x3030 || fs == 0x2b55 || fs == 0x2b1c || fs == 0x2b1b || fs == 0x2b50) {
                return true
            }
        }
        return false
    }
}
