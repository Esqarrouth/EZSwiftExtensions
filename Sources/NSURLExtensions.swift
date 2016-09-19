//
//  NSURLExtensions.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2016/01/11.
//  Modified by mousavian on 2016/05/24.
//  Copyright (c) 2016 Goktug Yilmaz. All rights reserved.
//
// swiftlint:disable line_length
// swiftlint:disable trailing_whitespace

import UIKit

extension URL {
    /// EZSE: Returns convert query to Dictionary
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }

        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }

    /// EZSE: Returns remote size of url, don't use it in main thread
    public func remoteSize(_ completionHandler: @escaping ((_ contentLength: Int64) -> Void), timeoutInterval: TimeInterval = 30) {
        let request = NSMutableURLRequest(url: self, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
        request.httpMethod = "HEAD"
        request.setValue("", forHTTPHeaderField: "Accept-Encoding")
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            let contentLength: Int64 = response?.expectedContentLength ?? NSURLSessionTransferSizeUnknown
            DispatchQueue.global(qos: .default).async(execute: {
                completionHandler(contentLength)
            })
        }.resume()
    }

    /// EZSE: Returns server supports resuming or not, don't use it in main thread
    public func supportsResume(_ completionHandler: @escaping ((_ doesSupport: Bool) -> Void), timeoutInterval: TimeInterval = 30) {
        let request = NSMutableURLRequest(url: self, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
        request.httpMethod = "HEAD"
        request.setValue("bytes=5-10", forHTTPHeaderField: "Range")
        URLSession.shared.dataTask(with: request as URLRequest) { (_, response, _) -> Void in
            let responseCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            DispatchQueue.global(qos: .default).async(execute: {
                completionHandler(responseCode == 206)
            })
        }.resume()
    }

    /// EZSE: Compare two URLs
    public func isSameWithURL(_ url: URL) -> Bool {
        if self == url {
            return true
        }
        if self.scheme?.lowercased() != url.scheme?.lowercased() {
            return false
        }
        if let host1 = self.host, let host2 = url.host {
            let whost1 = host1.hasPrefix("www.") ? host1 : "www." + host1
            let whost2 = host2.hasPrefix("www.") ? host2 : "www." + host2
            if whost1 != whost2 {
                return false
            }
        }
        let pathdelimiter = CharacterSet(charactersIn: "/")
        if self.path.lowercased().trimmingCharacters(in: pathdelimiter) != url.path.lowercased().trimmingCharacters(in: pathdelimiter) {
            return false
        }
        if (self as NSURL).port != (url as NSURL).port {
            return false
        }
        if self.query?.lowercased() != url.query?.lowercased() {
            return false
        }
        return true
    }

    /// EZSE: Returns true if given file is a directory
    public var fileIsDirectory: Bool {
        var isdirv: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&isdirv, forKey: URLResourceKey.isDirectoryKey)
        } catch _ {
        }
        return isdirv?.boolValue ?? false
    }

    /// EZSE: File modification date, nil if file doesn't exist
    public var fileModifiedDate: Date? {
        get {
            var datemodv: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&datemodv, forKey: URLResourceKey.contentModificationDateKey)
            } catch _ {
            }
            return datemodv as? Date
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.contentModificationDateKey)
            } catch _ {
            }
        }
    }

    /// EZSE: File creation date, nil if file doesn't exist
    public var fileCreationDate: Date? {
        get {
            var datecreatev: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&datecreatev, forKey: URLResourceKey.creationDateKey)
            } catch _ {
            }
            return datecreatev as? Date
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.creationDateKey)
            } catch _ {
            }

        }
    }

    /// EZSE: Returns last file access date, nil if file doesn't exist or not yet accessed
    public var fileAccessDate: Date? {
        _ = URLResourceKey.customIconKey
        var dateaccessv: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&dateaccessv, forKey: URLResourceKey.contentAccessDateKey)
        } catch _ {
        }
        return dateaccessv as? Date
    }

    /// EZSE: Returns file size, -1 if file doesn't exist
    public var fileSize: Int64 {
        var sizev: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&sizev, forKey: URLResourceKey.fileSizeKey)
        } catch _ {
        }
        return sizev?.int64Value ?? -1
    }

    /// EZSE: File is hidden or not, don't care about files beginning with dot
    public var fileIsHidden: Bool {
        get {
            var ishiddenv: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&ishiddenv, forKey: URLResourceKey.isHiddenKey)
            } catch _ {
            }
            return ishiddenv?.boolValue ?? false
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.isHiddenKey)
            } catch _ {
            }
            
        }
    }

    /// EZSE: Checks if file is writable
    public var fileIsWritable: Bool {
        var isdirv: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&isdirv, forKey: URLResourceKey.isWritableKey)
        } catch _ {
        }
        return isdirv?.boolValue ?? false
    }

    #if (OSX)
    @available(OSX 10.10, *)
    internal var fileThumbnailsDictionary: [String: NSImage]? {
        get {
            var thumbsData: AnyObject?
            do {
            try self.getResourceValue(&thumbsData, forKey: NSURLThumbnailDictionaryKey)
            } catch _ {
            }
            return thumbsData as? [String: NSImage]
        }
        set {
            do {
            let dic = NSDictionary(dictionary: newValue ?? [:])
            try self.setResourceValue(dic, forKey: NSURLThumbnailDictionaryKey)
            } catch _ {
            }
        }
    }

    /// EZSE: File thubmnail saved in system or iCloud in form of 1024pxx1024px
    @available(OSX 10.10, *)
    public var fileThumbnail1024px: NSImage? {
        get {
            return fileThumbnailsDictionary?[NSThumbnail1024x1024SizeKey]
        }
        set {
            assert(newValue == nil || (newValue?.size.height == 1024 && newValue?.size.width == 1024), "Image size set in fileThumbnail1024px is not 1024x1024")
            fileThumbnailsDictionary?[NSThumbnail1024x1024SizeKey] = newValue
        }
    }

    #else
    @available(iOS 8.0, *)
    internal var fileThumbnailsDictionary: [String: UIImage]? {
        get {
            var thumbsData: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&thumbsData, forKey: URLResourceKey.thumbnailDictionaryKey)
            } catch _ {
            }
            return thumbsData as? [String: UIImage]
        }
        set {
            do {
                let dic = NSDictionary(dictionary: newValue ?? [:])
                try (self as NSURL).setResourceValue(dic, forKey: URLResourceKey.thumbnailDictionaryKey)
            } catch _ {
            }
        }
    }

    /// EZSE: File thubmnail saved in system or iCloud in form of 1024pxx1024px
    @available(iOS 8.0, *)
    var fileThumbnail1024px: UIImage? {
        get {
            return fileThumbnailsDictionary?[URLThumbnailDictionaryItem.NSThumbnail1024x1024SizeKey.rawValue]
        }
        set {
            assert(newValue == nil || (newValue?.size.height == 1024 && newValue?.size.width == 1024), "Image size set in fileThumbnail1024px is not 1024x1024")
            fileThumbnailsDictionary?[URLThumbnailDictionaryItem.NSThumbnail1024x1024SizeKey.rawValue] = newValue
        }
    }
    #endif

    /// EZSE: Set SkipBackup attrubute of file or directory in iOS. return current state if no value is set
    public func skipBackupAttributeToItemAtURL(_ skip: Bool? = nil) -> Bool {
        let keys = [URLResourceKey.isDirectoryKey, URLResourceKey.fileSizeKey]
        let enumOpt = FileManager.DirectoryEnumerationOptions()
        if FileManager.default.fileExists(atPath: self.path) {
            if skip != nil {
                if self.fileIsDirectory {
                    let filesList = (try? FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: keys, options: enumOpt)) ?? []
                    for fileURL in filesList {
                        _ = fileURL.skipBackupAttributeToItemAtURL(skip)
                    }
                }
                do {
                    try (self as NSURL).setResourceValue(NSNumber(value: skip! as Bool), forKey: URLResourceKey.isExcludedFromBackupKey)
                    return true
                } catch _ {
                    return false
                }
            } else {
                let dict = try? (self as NSURL).resourceValues(forKeys: [URLResourceKey.isExcludedFromBackupKey])
                if  let key: AnyObject = dict?[URLResourceKey.isExcludedFromBackupKey] as AnyObject? {
                    return key.boolValue
                }
                return false
            }
        }
        return false
    }
}
