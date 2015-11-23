//
//  EZSwiftExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 13/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

//TODO: others standart video, gif

public struct ez {
    
    /// EZSwift Extensions
    public static var appVersion: String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
    }
    
    /// EZSwiftExtensions
    public static var appBuild: String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String
    }
    
    /// EZSwiftExtensions
    public static var appVersionAndBuild: String {
        let version = appVersion, build = appBuild
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
    
    /// EZSwiftExtensions - Gives you the VC on top so you can easily push your popups
    public static var topMostVC: UIViewController? {
        var presentedVC = UIApplication.sharedApplication().keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("EZSwiftExtensions Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
        }
        return presentedVC
    }
    
    /// EZSwiftExtensions
    public static var screenOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    /// EZSwiftExtensions
    public static var screenWidth: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.width
        } else {
            return UIScreen.mainScreen().bounds.size.height
        }
    }
    
    /// EZSwiftExtensions
    public static var screenHeight: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.height
        } else {
            return UIScreen.mainScreen().bounds.size.width
        }
    }
    
    /// EZSwiftExtensions
    public static var screenStatusBarHeight: CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
    
    /// EZSwiftExtensions
    public static var screenHeightWithoutStatusBar: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.height - screenStatusBarHeight
        } else {
            return UIScreen.mainScreen().bounds.size.width - screenStatusBarHeight
        }
    }
    
    /// EZSwiftExtensions - Calls action when a screen shot is taken
    public static func detectScreenShot(action: () -> ()) {
        let mainQueue = NSOperationQueue.mainQueue()
        NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationUserDidTakeScreenshotNotification, object: nil, queue: mainQueue) { notification in
            // executes after screenshot
            action()
        }
    }
    
    // MARK: - Dispatch
    
    /// EZSwiftExtensions
    public static func runThisMany(times times: Int, block: () -> ()) {
        for _ in 0..<times {
            block()
        }
    }
    
    /// EZSwiftExtensions
    public static func runThisAfterDelay(seconds seconds: Double, after: () -> ()) {
        runThisAfterDelay(seconds: seconds, queue: dispatch_get_main_queue(), after: after)
    }
    
    //TODO: Make this easier
    /// EZSwiftExtensions - dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    public static func runThisAfterDelay(seconds seconds: Double, queue: dispatch_queue_t, after: ()->()) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(time, queue, after)
    }
    
    /// EZSwiftExtensions - Submits a block for asynchronous execution on the main queue
    public static func runThisInMainThread(block: dispatch_block_t) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    /// EZSwiftExtensions - Runs in Default priority queue
    public static func runThisInBackground(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
    // MARK: - DownloadTask
    
    /// EZSwiftExtensions
    public static func requestImage(url: String, success: (UIImage?) -> Void) {
        requestURL(url, success: { (data) -> Void in
            if let d = data {
                success(UIImage(data: d))
            }
        })
    }
    
    /// EZSwiftExtensions
    public static func requestJSON(url: String, success: (AnyObject? -> Void), error: ((NSError) -> Void)?) {
        requestURL(url,
            success: { (data)->Void in
                let json: AnyObject? = self.dataToJsonDict(data)
                success(json)
            },
            error: { (err)->Void in
                if let e = error {
                    e(err)
                }
        })
    }
    
    /// EZSwiftExtensions
    private static func dataToJsonDict(data: NSData?) -> AnyObject? {
        if let d = data {
            var error: NSError?
            let json: AnyObject?
            do {
                json = try NSJSONSerialization.JSONObjectWithData(
                    d,
                    options: NSJSONReadingOptions.AllowFragments)
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
    
    /// EZSwiftExtensions
    private static func requestURL(url: String, success: (NSData?) -> Void, error: ((NSError) -> Void)? = nil) {
        NSURLConnection.sendAsynchronousRequest(
            NSURLRequest(URL: NSURL (string: url)!),
            queue: NSOperationQueue.mainQueue(),
            completionHandler: { response, data, err in
                if let e = err {
                    error?(e)
                } else {
                    success(data)
                }
        })
    }
    
}
