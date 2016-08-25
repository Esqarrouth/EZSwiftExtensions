//
//  UIApplicationExtensions.swift
//  EZSwiftExtensions
//
//  Created by Mousavian on 23/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//
import UIKit

extension UIApplication {
    /// EZSE: Run a block in background after app resigns activity
    public func runInBackground(closure: () -> Void, expirationHandler: (() -> Void)? = nil) {
        dispatch_async(dispatch_get_main_queue()) {
            let taskID: UIBackgroundTaskIdentifier
            if let expirationHandler = expirationHandler {
                taskID = self.beginBackgroundTaskWithExpirationHandler(expirationHandler)
            } else {
                taskID = self.beginBackgroundTaskWithExpirationHandler({ })
            }
            closure()
            self.endBackgroundTask(taskID)
        }
    }

    /// EZSE: Get the top most view controller from the base view controller; default param is UIWindow's rootViewController
    public class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
