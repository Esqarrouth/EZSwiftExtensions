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
    case none = ""
    case regular = "Regular"
    case bold = "Bold"
    case demiBold = "DemiBold"
    case light = "Light"
    case ultraLight = "UltraLight"
    case italic = "Italic"
    case thin = "Thin"
    case book = "Book"
    case roman = "Roman"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case condensedMedium = "CondensedMedium"
    case condensedExtraBold = "CondensedExtraBold"
    case semiBold = "SemiBold"
    case boldItalic = "BoldItalic"
    case heavy = "Heavy"
}

/// EZSwiftExtensions
public enum FontName: String {
    case helveticaNeue = "HelveticaNeue"
    case helvetica = "Helvetica"
    case futura = "Futura"
    case menlo = "Menlo"
    case avenir = "Avenir"
    case avenirNext = "AvenirNext"
    case didot = "Didot"
    case americanTypewriter = "AmericanTypewriter"
    case baskerville = "Baskerville"
    case geneva = "Geneva"
    case gillSans = "GillSans"
    case sanFranciscoDisplay = "SanFranciscoDisplay"
    case seravek = "Seravek"
}

extension UIFont {

    /// EZSwiftExtensions
    public class func Font(_ name: FontName, type: FontType, size: CGFloat) -> UIFont! {
      //Using type
      let fontName = name.rawValue + "-" + type.rawValue
      if let font = UIFont(name: fontName, size: size) {
          return font
      }

      //That font doens't have that type, try .None
      let fontNameNone = name.rawValue
      if let font = UIFont(name: fontNameNone, size: size) {
          return font
      }

      //That font doens't have that type, try .Regular
      let fontNameRegular = name.rawValue + "-" + "Regular"
      if let font = UIFont(name: fontNameRegular, size: size) {
          return font
      }

      return nil
    }

    /// EZSwiftExtensions
    public class func HelveticaNeue(type: FontType, size: CGFloat) -> UIFont {
        return Font(.helveticaNeue, type: type, size: size)
    }

    /// EZSwiftExtensions
    public class func AvenirNext(type: FontType, size: CGFloat) -> UIFont {
        return Font(.avenirNext, type: type, size: size)
    }

    /// EZSwiftExtensions
    public class func AvenirNextDemiBold(size: CGFloat) -> UIFont {
        return Font(.avenirNext, type: .demiBold, size: size)
    }

    /// EZSwiftExtensions
    public class func AvenirNextRegular(size: CGFloat) -> UIFont {
        return Font(.avenirNext, type: .regular, size: size)
    }

    // MARK: Deprecated

    /// EZSwiftExtensions
    @available(*, deprecated: 1.8)
    public class func PrintFontFamily(_ font: FontName) {
        let arr = UIFont.fontNames(forFamilyName: font.rawValue)
        for name in arr {
            print(name)
        }
    }
}
