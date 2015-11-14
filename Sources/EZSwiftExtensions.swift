//
//  EZSwiftExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 13/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

//TODO: others standart video, gif

/// EZSwiftExtensions
public var appVersion: String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
}

/// EZSwiftExtensions
public var appBuild: String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String
}

/// EZSwiftExtensions
public var appVersionAndBuild: String {
    let version = appVersion, build = appBuild
    return version == build ? "v\(version)" : "v\(version)(\(build))"
}

/// EZSwiftExtensions - Your normal appDelegate
public var appDelegateVariable: UIApplicationDelegate {
    return UIApplication.sharedApplication().delegate!
}

/// EZSwiftExtensions
public var appDelegateWindow: UIWindow {
    return UIApplication.sharedApplication().keyWindow!
}

/// EZSwiftExtensions - Gives you the VC on top so you can easily push your popups
public var topMostVC: UIViewController {
    var topController = appDelegateWindow.rootViewController!

    while let presentedVC = topController.presentedViewController {
        topController = presentedVC
    }
    return topController
}

/// EZSwiftExtensions
public var screenOrientation: UIInterfaceOrientation {
    return UIApplication.sharedApplication().statusBarOrientation
}

/// EZSwiftExtensions
public var screenWidth: CGFloat {
    if UIInterfaceOrientationIsPortrait(screenOrientation) {
        return UIScreen.mainScreen().bounds.size.width
    } else {
        return UIScreen.mainScreen().bounds.size.height
    }
}

/// EZSwiftExtensions
public var screenHeight: CGFloat {
    if UIInterfaceOrientationIsPortrait(screenOrientation) {
        return UIScreen.mainScreen().bounds.size.height
    } else {
        return UIScreen.mainScreen().bounds.size.width
    }
}

/// EZSwiftExtensions
public var screenStatusBarHeight: CGFloat {
    return UIApplication.sharedApplication().statusBarFrame.height
}

/// EZSwiftExtensions
public var screenHeightWithoutStatusBar: CGFloat {
    if UIInterfaceOrientationIsPortrait(screenOrientation) {
        return UIScreen.mainScreen().bounds.size.height - screenStatusBarHeight
    } else {
        return UIScreen.mainScreen().bounds.size.width - screenStatusBarHeight
    }
}

/// EZSwiftExtensions
public func forceCrash() {
    //NSException(name:NSGenericException, reason:"Everything is ok. This is just a test crash.", userInfo:nil).raise()
    while 1 == 1 {
        var hey: [Int] = []
        hey[0] = 1
    }
}

/// EZSwiftExtensions
public func prt(items: Any...) {
    print(items)
}

/// EZSwiftExtensions
public func prnt(items: Any...) {
    print(items)
}

/// EZSwiftExtensions - Calls action when a screen shot is taken
public func detectScreenShot(action: () -> ()) {
    let mainQueue = NSOperationQueue.mainQueue()
    NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationUserDidTakeScreenshotNotification, object: nil, queue: mainQueue) { notification in
        // executes after screenshot
        action()
    }
}

// MARK: - Dispatch

/// EZSwiftExtensions
public func runThisMany(times times: Int, block: () -> ()) {
    for _ in 0..<times {
        block()
    }
}

/// EZSwiftExtensions
public func runThisAfterDelay(seconds seconds: Double, after: () -> ()) {
    runThisAfterDelay(seconds: seconds, queue: dispatch_get_main_queue(), after: after)
}

//TODO: Make this easier
/// EZSwiftExtensions - dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
public func runThisAfterDelay(seconds seconds: Double, queue: dispatch_queue_t, after: ()->()) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, after)
}

/// EZSwiftExtensions - Submits a block for asynchronous execution on the main queue
public func runThisInMainThread(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}

/// EZSwiftExtensions
public func runThisBlock(block: () -> ()) {
    block()
}

/// EZSwiftExtensions - Runs in Default priority queue
public func runThisInBackground(block: () -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
}

// MARK: - DownloadTask

/// EZSwiftExtensions
public func requestImage(url: String, success: (UIImage?) -> Void) {
    requestURL(url, success: { (data) -> Void in
        if let d = data {
            success(UIImage(data: d))
        }
    })
}

/// EZSwiftExtensions
public func requestJSON(url: String, success: (AnyObject? -> Void), error: ((NSError) -> Void)?) {
    requestURL(url,
        success: { (data)->Void in
            let json: AnyObject? = dataToJsonDict(data)
            success(json)
        },
        error: { (err)->Void in
            if let e = error {
                e(err)
            }
    })
}

/// EZSwiftExtensions
private func dataToJsonDict(data: NSData?) -> AnyObject? {
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
private func requestURL(url: String, success: (NSData?) -> Void, error: ((NSError) -> Void)? = nil) {
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


