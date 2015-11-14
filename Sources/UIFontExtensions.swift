//
//  CEMKit+UIFont.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//
import UIKit

/// EZSwiftExtensions
public enum FontType: String {
    case None = ""
    case Regular = "Regular"
    case Bold = "Bold"
    case DemiBold = "DemiBold"
    case Light = "Light"
    case UltraLight = "UltraLight"
    case Italic = "Italic"
    case Thin = "Thin"
    case Book = "Book"
    case Roman = "Roman"
    case Medium = "Medium"
    case MediumItalic = "MediumItalic"
    case CondensedMedium = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold = "SemiBold"
    case BoldItalic = "BoldItalic"
    case Heavy = "Heavy"
}

/// EZSwiftExtensions
public enum FontName: String {
    case HelveticaNeue = "HelveticaNeue"
    case Helvetica = "Helvetica"
    case Futura = "Futura"
    case Menlo = "Menlo"
    case Avenir = "Avenir"
    case AvenirNext = "AvenirNext"
    case Didot = "Didot"
    case AmericanTypewriter = "AmericanTypewriter"
    case Baskerville = "Baskerville"
    case Geneva = "Geneva"
    case GillSans = "GillSans"
    case SanFranciscoDisplay = "SanFranciscoDisplay"
    case Seravek = "Seravek"
}

extension UIFont {
    
    /// EZSwiftExtensions
    public class func PrintFontFamily(font: FontName) {
        let arr = UIFont.fontNamesForFamilyName(font.rawValue)
        for name in arr {
            print(name)
        }
    }
    
    /// EZSwiftExtensions
    public class func Font(name: FontName, type: FontType, size: CGFloat) -> UIFont {
        if type == FontType.None {
            return UIFont(name: name.rawValue, size: size)!
        }
        return UIFont(name: name.rawValue + "-" + type.rawValue, size: size)!
    }
    
    /// EZSwiftExtensions
    public class func HelveticaNeue(type type: FontType, size: CGFloat) -> UIFont {
        return Font(.HelveticaNeue, type: type, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNext(type type: FontType, size: CGFloat) -> UIFont {
        return UIFont.Font(.AvenirNext, type: type, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNextDemiBold(size size: CGFloat) -> UIFont {
        return AvenirNext(type: .DemiBold, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNextRegular(size size: CGFloat) -> UIFont {
        return AvenirNext(type: .Regular, size: size)
    }
}

