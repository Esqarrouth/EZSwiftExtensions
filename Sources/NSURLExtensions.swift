//
//  NSURLExtensions.swift
//  EZSwiftExtensions
//
//  Created by furuyan on 2016/01/11.
//  Modified by mousavian on 2016/05/24.
//  Copyright (c) 2016 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension NSURL {
    /// EZSE: Returns convert query to Dictionary
    public var queryParameters: [String: String]? {
        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true), queryItems = components.queryItems else {
            return nil
        }

        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }

    /// EZSE: Returns remote size of url, don't use it in main thread
    public func remoteSize(completionHandler: ((contentLength: Int64) -> Void), timeoutInterval: NSTimeInterval = 30) {
        let request = NSMutableURLRequest(URL: self, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
        request.HTTPMethod = "HEAD";
        request.setValue("", forHTTPHeaderField: "Accept-Encoding")
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (_, response, _) -> Void in
            let contentLength: Int64 = response?.expectedContentLength ?? NSURLSessionTransferSizeUnknown
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                completionHandler(contentLength: contentLength)
            })
        }).resume()
    }

    /// EZSE: Returns server supports resuming or not, don't use it in main thread
    public func supportsResume(completionHandler: ((doesSupport: Bool) -> Void), timeoutInterval: NSTimeInterval = 30) {
        let request = NSMutableURLRequest(URL: self, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
        request.HTTPMethod = "HEAD";
        request.setValue("bytes=5-10", forHTTPHeaderField: "Range")
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (_, response, _) -> Void in
            let responseCode = (response as? NSHTTPURLResponse)?.statusCode ?? -1
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                completionHandler(doesSupport: responseCode == 206)
            })
        }).resume()
    }

    /// EZSE: Compare two URLs
    public func isSameWithURL(url: NSURL) -> Bool {
        if self == url {
            return true
        }
        if self.scheme.lowercaseString != url.scheme.lowercaseString {
            return false
        }
        if let host1 = self.host, host2 = url.host {
            let whost1 = host1.hasPrefix("www.") ? host1 : "www." + host1
            let whost2 = host2.hasPrefix("www.") ? host2 : "www." + host2
            if whost1 != whost2 {
                return false
            }
        }
        let pathdelimiter = NSCharacterSet(charactersInString: "/")
        if self.path?.lowercaseString.stringByTrimmingCharactersInSet(pathdelimiter) != url.path?.lowercaseString.stringByTrimmingCharactersInSet(pathdelimiter) {
            return false
        }
        if self.port != url.port {
            return false
        }
        if self.query?.lowercaseString != url.query?.lowercaseString {
            return false
        }
        return true
    }

    /// EZSE: Returns true of given file is a directory
    public var fileIsDirectory: Bool {
        var isdirv: AnyObject?
        do {
            try self.getResourceValue(&isdirv, forKey: NSURLIsDirectoryKey)
        } catch _ {
        }
        return isdirv?.boolValue ?? false
    }

    /// EZSE: File modification date, nil if file doesn't exist
    public var fileModifiedDate: NSDate? {
        get {
            var datemodv: AnyObject?
            do {
                try self.getResourceValue(&datemodv, forKey: NSURLContentModificationDateKey)
            } catch _ {
            }
            return datemodv as? NSDate
        }
        set {
            do {
                try self.setResourceValue(newValue, forKey: NSURLContentModificationDateKey)
            } catch _ {
            }
        }
    }

    /// EZSE: File creation date, nil if file doesn't exist
    public var fileCreationDate: NSDate? {
        get {
            var datecreatev: AnyObject?
            do {
                try self.getResourceValue(&datecreatev, forKey: NSURLCreationDateKey)
            } catch _ {
            }
            return datecreatev as? NSDate
        }
        set {
            do {
                try self.setResourceValue(newValue, forKey: NSURLCreationDateKey)
            } catch _ {
            }

        }
    }

    /// EZSE: Returns last file access date, nil if file doesn't exist or didn't accessed yet
    public var fileAccessDate: NSDate? {
        NSURLCustomIconKey
        var dateaccessv: AnyObject?
        do {
            try self.getResourceValue(&dateaccessv, forKey: NSURLContentAccessDateKey)
        } catch _ {
        }
        return dateaccessv as? NSDate
    }

    /// EZSE: Returns file size, -1 if file doesn't exist
    public var fileSize: Int64 {
        var sizev: AnyObject?
        do {
            try self.getResourceValue(&sizev, forKey: NSURLFileSizeKey)
        } catch _ {
        }
        return sizev?.longLongValue ?? -1
    }

    /// EZSE: File is hidden or not, don't care about files begining with dot
    public var fileIsHidden: Bool {
        get {
            var ishiddenv: AnyObject?
            do {
                try self.getResourceValue(&ishiddenv, forKey: NSURLIsHiddenKey)
            } catch _ {
            }
            return ishiddenv?.boolValue ?? false
        }
        set {
            do {
                try self.setResourceValue(newValue, forKey: NSURLIsHiddenKey)
            } catch _ {
            }
            
        }
    }

    /// EZSE: Checks file is writable
    public var fileIsWritable: Bool {
        var isdirv: AnyObject?
        do {
            try self.getResourceValue(&isdirv, forKey: NSURLIsWritableKey)
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
                try self.getResourceValue(&thumbsData, forKey: NSURLThumbnailDictionaryKey)
            } catch _ {
            }
            return thumbsData as? [String: UIImage]
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
    @available(iOS 8.0, *)
    var fileThumbnail1024px: UIImage? {
        get {
            return fileThumbnailsDictionary?[NSThumbnail1024x1024SizeKey]
        }
        set {
            assert(newValue == nil || (newValue?.size.height == 1024 && newValue?.size.width == 1024), "Image size set in fileThumbnail1024px is not 1024x1024")
            fileThumbnailsDictionary?[NSThumbnail1024x1024SizeKey] = newValue
        }
    }
    #endif

    /// EZSE: Set SkipBackup attrubute of file or directory in iOS. return current state if no value is set
    public func skipBackupAttributeToItemAtURL(skip: Bool? = nil) -> Bool {
        let keys = [NSURLIsDirectoryKey, NSURLFileSizeKey]
        let enumOpt = NSDirectoryEnumerationOptions()
        if NSFileManager.defaultManager().fileExistsAtPath(self.path!) {
            if skip != nil {
                if self.fileIsDirectory {
                    let filesList = (try? NSFileManager.defaultManager().contentsOfDirectoryAtURL(self, includingPropertiesForKeys: keys, options: enumOpt)) ?? []
                    for fileURL in filesList {
                        fileURL.skipBackupAttributeToItemAtURL(skip);
                    }
                }
                do {
                    try self.setResourceValue(NSNumber(bool: skip!), forKey: NSURLIsExcludedFromBackupKey)
                    return true
                } catch _ {
                    return false
                }
            } else {
                let dict = try? self.resourceValuesForKeys([NSURLIsExcludedFromBackupKey])
                if  let key: AnyObject = dict?[NSURLIsExcludedFromBackupKey] {
                    return key.boolValue
                }
                return false
            }
        }
        return false
    }
}
