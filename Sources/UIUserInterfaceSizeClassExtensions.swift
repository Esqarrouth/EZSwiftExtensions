//
//  UIUserInterfaceSizeClassExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation
import UIKit

extension UIUserInterfaceSizeClass {
  /// EZSwiftExtensions
  public var stringValue: String {
    switch self.rawValue {
    case 1:
      return "Compact"
    case 2:
      return "Regular"
    default:
      return "Unspecified"
    }
  }
}
