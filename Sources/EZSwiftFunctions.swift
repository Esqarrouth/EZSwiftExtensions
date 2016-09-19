//
//  EZSwiftFunctions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 13/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

//TODO: others standart video, gif

public struct ez {
    /// EZSE: Returns app's name
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }

        return nil
    }

    /// EZSE: Returns app's version number
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /// EZSE: Return app's build number
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

    /// EZSE: Returns both app's version and build numbers "v0.3(7)"
    public static var appVersionAndBuild: String? {
        if appVersion != nil && appBuild != nil {
            if appVersion == appBuild {
                return "v\(appVersion!)"
            } else {
                return "v\(appVersion!)(\(appBuild!))"
            }
        }
        return nil
    }

    /// EZSE: Return device version ""
    public static var deviceVersion: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }

    /// EZSE: Returns true if DEBUG mode is active //TODO: Add to readme
    public static var isDebug: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
    }

    /// EZSE: Returns true if RELEASE mode is active //TODO: Add to readme
    public static var isRelease: Bool {
    #if DEBUG
        return false
    #else
        return true
    #endif
    }

    /// EZSE: Returns true if its simulator and not a device //TODO: Add to readme
    public static var isSimulator: Bool {
    #if (arch(i386) || arch(x86_64)) && os(iOS)
        return true
    #else
        return false
    #endif
    }

    /// EZSE: Returns true if its on a device and not a simulator //TODO: Add to readme
    public static var isDevice: Bool {
    #if (arch(i386) || arch(x86_64)) && os(iOS)
        return false
    #else
        return true
    #endif
    }

    /// EZSE: Returns the top ViewController
    public static var topMostVC: UIViewController? {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }

        if presentedVC == nil {
            print("EZSwiftExtensions Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
        }
        return presentedVC
    }

    #if os(iOS)
    
    /// EZSE: Returns current screen orientation
    public static var screenOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    #endif

    /// EZSwiftExtensions
    public static var horizontalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.horizontalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    /// EZSwiftExtensions
    public static var verticalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.verticalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    /// EZSE: Returns screen width
    public static var screenWidth: CGFloat {
        
        #if os(iOS)
            
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }
        
        #elseif os(tvOS)
            
        return UIScreen.mainScreen().bounds.size.width
        
        #endif
    }

    /// EZSE: Returns screen height
    public static var screenHeight: CGFloat {
        
        #if os(iOS)
        
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
        
        #elseif os(tvOS)
            
            return UIScreen.mainScreen().bounds.size.height
            
        #endif
    }
    
    #if os(iOS)

    /// EZSE: Returns StatusBar height
    public static var screenStatusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    /// EZSE: Return screen's height without StatusBar
    public static var screenHeightWithoutStatusBar: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.height - screenStatusBarHeight
        } else {
            return UIScreen.main.bounds.size.width - screenStatusBarHeight
        }
    }
    
    #endif

    /// EZSE: Returns the locale country code. An example value might be "ES". //TODO: Add to readme
    public static var currentRegion: String? {
        return (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String
    }

    /// EZSE: Calls action when a screen shot is taken
    public static func detectScreenShot(_ action: @escaping () -> ()) {
        let mainQueue = OperationQueue.main
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: mainQueue) { notification in
            // executes after screenshot
            action()
        }
    }

    // MARK: - Dispatch


    /// EZSE: Runs function after x seconds
    public static func runThisAfterDelay(seconds: Double, after: @escaping () -> ()) {
        runThisAfterDelay(seconds: seconds, queue: DispatchQueue.main, after: after)
    }

    //TODO: Make this easier
    /// EZSE: Runs function after x seconds with dispatch_queue, use this syntax: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    public static func runThisAfterDelay(seconds: Double, queue: DispatchQueue, after: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }

    /// EZSE: Submits a block for asynchronous execution on the main queue
    public static func runThisInMainThread(_ block: @escaping ()->()) {
        DispatchQueue.main.async(execute: block)
    }

    /// EZSE: Runs in Default priority queue
    public static func runThisInBackground(_ block: @escaping () -> ()) {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: block)
    }

    /// EZSE: Runs every second, to cancel use: timer.invalidate()
    public static func runThisEvery(seconds: TimeInterval, startAfterSeconds: TimeInterval, handler: @escaping (CFRunLoopTimer?) -> Void) -> Timer {
        let fireDate = startAfterSeconds + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }

    // MARK: - DownloadTask

    /// EZSE: Downloads image from url string
    public static func requestImage(_ url: String, success: @escaping (UIImage?) -> Void) {
        requestURL(url, success: { (data) -> Void in
            if let d = data {
                success(UIImage(data: d))
            }
        })
    }

    /// EZSE: Downloads JSON from url string
    public static func requestJSON(_ url: String, success: @escaping ((Any?) -> Void), error: ((NSError) -> Void)?) {
        requestURL(url,
            success: { (data) -> Void in
                let json: Any? = self.dataToJsonDict(data)
                success(json)
            },
            error: { (err) -> Void in
                if let e = error {
                    e(err)
                }
        })
    }

    /// EZSE: converts NSData to JSON dictionary
    fileprivate static func dataToJsonDict(_ data: Data?) -> Any? {
        if let d = data {
            var error: NSError?
            let json: Any?
            do {
                json = try JSONSerialization.jsonObject(
                    with: d,
                    options: JSONSerialization.ReadingOptions.allowFragments)
            } catch let error1 as NSError {
                error = error1
                json = nil
            }

            if let _ = error {
                return nil
            } else {
                return json
            }
        } else {
            return nil
        }
    }

    /// EZSE:
    fileprivate static func requestURL(_ url: String, success: @escaping (Data?) -> Void, error: ((NSError) -> Void)? = nil) {
        guard let requestURL = URL(string: url) else {
            assertionFailure("EZSwiftExtensions Error: Invalid URL")
            return
        }

        URLSession.shared.dataTask(
            with: URLRequest(url: requestURL),
            completionHandler: { data, response, err in
                if let e = err {
                    error?(e as NSError)
                } else {
                    success(data)
                }
        }).resume()
    }
}
