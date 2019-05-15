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
    public var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x3030, 0x00AE, 0x00A9, // Special Characters
        0x1D000...0x1F77F, // Emoticons
        0x2100...0x27BF, // Misc symbols and Dingbats
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
            return true
        default:
            return false
        }
    }
}
