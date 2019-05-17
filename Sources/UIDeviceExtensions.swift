//
//  UIDeviceExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit


extension UIDevice {
    public class func deviceModelReadable() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)
        
        for child in mirror.children {
            let value = child.value
            
            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        //simulator
        if identifier == "i386"        { return "Simulator" }
        if identifier == "x86_64"      { return "Simulator" }
        
        //AirPods
        if identifier == "AirPods1,1"  { return "AirPods" }
        
        //Apple TV
        if identifier == "AppleTV2,1"  { return "Apple TV (2nd generation)" }
        if identifier == "AppleTV3,1"  { return "Apple TV (3rd generation)" }
        if identifier == "AppleTV3,2"  { return "Apple TV (3rd generation)" }
        if identifier == "AppleTV5,3"  { return "Apple TV (4th generation)" }
        if identifier == "AppleTV6,2"  { return "Apple TV 4K" }
        
        //Apple Watch
        if identifier == "Watch1,1"  { return "Apple Watch (1st generation)" }
        if identifier == "Watch1,2"  { return "Apple Watch (1st generation)" }
        if identifier == "Watch2,6"  { return "Apple Watch Series 1" }
        if identifier == "Watch2,7"  { return "Apple Watch Series 1" }
        if identifier == "Watch2,3"  { return "Apple Watch Series 2" }
        if identifier == "Watch2,4"  { return "Apple Watch Series 2" }
        if identifier == "Watch3,1"  { return "Apple Watch Series 3" }
        if identifier == "Watch3,2"  { return "Apple Watch Series 3" }
        if identifier == "Watch3,3"  { return "Apple Watch Series 3" }
        if identifier == "Watch3,4"  { return "Apple Watch Series 3" }
        
        //HomePod
        if identifier == "AudioAccessory1,1"  { return "HomePod" }
        
        //iPad
        if identifier == "iPad1,1"  { return "iPad" }
        if identifier == "iPad2,1"  { return "iPad 2" }
        if identifier == "iPad2,2"  { return "iPad 2" }
        if identifier == "iPad2,3"  { return "iPad 2" }
        if identifier == "iPad2,4"  { return "iPad 2" }
        if identifier == "iPad3,1"  { return "iPad (3rd generation)" }
        if identifier == "iPad3,2"  { return "iPad (3rd generation)" }
        if identifier == "iPad3,3"  { return "iPad (3rd generation)" }
        if identifier == "iPad3,4"  { return "iPad (4th generation)" }
        if identifier == "iPad3,5"  { return "iPad (4th generation)" }
        if identifier == "iPad3,6"  { return "iPad (4th generation)" }
        if identifier == "iPad4,1"  { return "iPad Air" }
        if identifier == "iPad4,2"  { return "iPad Air" }
        if identifier == "iPad4,3"  { return "iPad Air" }
        if identifier == "iPad5,3"  { return "iPad Air 2" }
        if identifier == "iPad5,4"  { return "iPad Air 2" }
        if identifier == "iPad6,7"  { return "iPad Pro (12.9-inch)" }
        if identifier == "iPad6,8"  { return "iPad Pro (12.9-inch)" }
        if identifier == "iPad6,3"  { return "iPad Pro (9.7-inch)" }
        if identifier == "iPad6,4"  { return "iPad Pro (9.7-inch)" }
        if identifier == "iPad6,11"  { return "iPad (5th generation)" }
        if identifier == "iPad6,12"  { return "iPad (5th generation)" }
        if identifier == "iPad7,1"  { return "iPad Pro (12.9-inch, 2nd generation)" }
        if identifier == "iPad7,2"  { return "iPad Pro (12.9-inch, 2nd generation)" }
        if identifier == "iPad7,3"  { return "iPad Pro (10.5-inch)" }
        if identifier == "iPad7,4"  { return "iPad Pro (10.5-inch)" }
        if identifier == "iPad7,5"  { return "iPad (6th generation)" }
        if identifier == "iPad7,6"  { return "iPad (6th generation)" }
        
        //iPad mini
        if identifier == "iPad2,5"  { return "iPad mini" }
        if identifier == "iPad2,6"  { return "iPad mini" }
        if identifier == "iPad2,7"  { return "iPad mini" }
        if identifier == "iPad4,4"  { return "iPad mini 2" }
        if identifier == "iPad4,5"  { return "iPad mini 2" }
        if identifier == "iPad4,6"  { return "iPad mini 2" }
        if identifier == "iPad4,7"  { return "iPad mini 3" }
        if identifier == "iPad4,8"  { return "iPad mini 3" }
        if identifier == "iPad4,9"  { return "iPad mini 3" }
        if identifier == "iPad5,1"  { return "iPad mini 4" }
        if identifier == "iPad5,2"  { return "iPad mini 4" }
        
        //iPhone
        if identifier == "iPhone1,1"  { return "iPhone 1G" }
        if identifier == "iPhone1,2"  { return "iPhone 3G" }
        if identifier == "iPhone2,1"  { return "iPhone 3GS" }
        if identifier == "iPhone3,1"  { return "iPhone 4" }
        if identifier == "iPhone3,2"  { return "iPhone 4" }
        if identifier == "iPhone4,1"  { return "iPhone 4S" }
        if identifier == "iPhone5,1"  { return "iPhone 5" }
        if identifier == "iPhone5,2"  { return "iPhone 5" }
        if identifier == "iPhone5,3"  { return "iPhone 5C" }
        if identifier == "iPhone5,4"  { return "iPhone 5C" }
        if identifier == "iPhone6,1"  { return "iPhone 5S" }
        if identifier == "iPhone6,2"  { return "iPhone 5S" }
        if identifier == "iPhone7,1"  { return "iPhone 6 Plus" }
        if identifier == "iPhone7,2"  { return "iPhone 6" }
        if identifier == "iPhone8,1"  { return "iPhone 6s" }
        if identifier == "iPhone8,2"  { return "iPhone 6s Plus" }
        if identifier == "iPhone8,4"  { return "iPhone SE" }
        if identifier == "iPhone9,1"  { return "iPhone 7" }
        if identifier == "iPhone9,3"  { return "iPhone 7" }
        if identifier == "iPhone9,2"  { return "iPhone 7 Plus" }
        if identifier == "iPhone9,4"  { return "iPhone 7 Plus" }
        if identifier == "iPhone10,1"  { return "iPhone 8" }
        if identifier == "iPhone10,4"  { return "iPhone 8" }
        if identifier == "iPhone10,2"  { return "iPhone 8 Plus" }
        if identifier == "iPhone10,5"  { return "iPhone 8 Plus" }
        if identifier == "iPhone10,3"  { return "iPhone X" }
        if identifier == "iPhone10,6"  { return "iPhone X" }
        if identifier == "iPhone11,8"  { return "iPhone XR" }
        if identifier == "iPhone11,2"  { return "iPhone XS" }
        if identifier == "iPhone11,4"  { return "iPhone XS Max" }
        if identifier == "iPhone11,6"  { return "iPhone XS Max" }
        
        //iPod touch
        if identifier == "iPod1,1"  { return "iPod touch" }
        if identifier == "iPod2,1"  { return "iPod touch (2nd generation)" }
        if identifier == "iPod3,1"  { return "iPod touch (3rd generation)" }
        if identifier == "iPod4,1"  { return "iPod touch (4th generation)" }
        if identifier == "iPod5,1"  { return "iPod touch (5th generation)" }
        if identifier == "iPod7,1"  { return "iPod touch (6th generation)" }
        
        return ""
    }
}

extension UIDevice {
    /// EZSwiftExtensions
    public class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    /// EZSwiftExtensions - Operating system name
    public class func systemName() -> String {
        return UIDevice.current.systemName
    }

    /// EZSwiftExtensions - Operating system version
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }

    /// EZSwiftExtensions - Operating system version
    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }

    /// EZSwiftExtensions
    public class func deviceName() -> String {
        return UIDevice.current.name
    }

    /// EZSwiftExtensions
    public class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }

    /// EZSE: Returns true if the device is iPhone //TODO: Add to readme
    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    /// EZSE: Returns true if the device is iPad //TODO: Add to readme
    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

    /// EZSwiftExtensions
    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)

        for child in mirror.children {
            let value = child.value

            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }

        return identifier
    }

    //TODO: Fix syntax, add docs and readme for these methods:
    //TODO: Delete isSystemVersionOver()
    // MARK: - Device Version Checks

    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
        case eleven = 11.0
        case twelve = 12.0
    }

    public class func isVersion(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue && systemFloatVersion() < (version.rawValue + 1.0)
    }

    public class func isVersionOrLater(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue
    }

    public class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return systemFloatVersion() < (version.rawValue + 1.0)
    }

    public class var CURRENT_VERSION: String {
        return "\(systemFloatVersion())"
    }

    // MARK: iOS 5 Checks

    public class func IS_OS_5() -> Bool {
        return isVersion(.five)
    }

    public class func IS_OS_5_OR_LATER() -> Bool {
        return isVersionOrLater(.five)
    }

    public class func IS_OS_5_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.five)
    }

    // MARK: iOS 6 Checks

    public class func IS_OS_6() -> Bool {
        return isVersion(.six)
    }

    public class func IS_OS_6_OR_LATER() -> Bool {
        return isVersionOrLater(.six)
    }

    public class func IS_OS_6_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.six)
    }

    // MARK: iOS 7 Checks

    public class func IS_OS_7() -> Bool {
        return isVersion(.seven)
    }

    public class func IS_OS_7_OR_LATER() -> Bool {
        return isVersionOrLater(.seven)
    }

    public class func IS_OS_7_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.seven)
    }

    // MARK: iOS 8 Checks

    public class func IS_OS_8() -> Bool {
        return isVersion(.eight)
    }

    public class func IS_OS_8_OR_LATER() -> Bool {
        return isVersionOrLater(.eight)
    }

    public class func IS_OS_8_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.eight)
    }

    // MARK: iOS 9 Checks

    public class func IS_OS_9() -> Bool {
        return isVersion(.nine)
    }

    public class func IS_OS_9_OR_LATER() -> Bool {
        return isVersionOrLater(.nine)
    }

    public class func IS_OS_9_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.nine)
    }

    // MARK: iOS 10 Checks

    public class func IS_OS_10() -> Bool {
        return isVersion(.ten)
    }

    public class func IS_OS_10_OR_LATER() -> Bool {
        return isVersionOrLater(.ten)
    }

    public class func IS_OS_10_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.ten)
    }

    /// EZSwiftExtensions
    public class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }
}

#endif
