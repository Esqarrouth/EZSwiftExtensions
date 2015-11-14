//
//  UIViewControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIViewController {
    
    // MARK: - Notifications
    //TODO: Document this part
    func addNotificationObserver(name: String, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }
    
    func removeNotificationObserver(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }
    
    func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func addKeyboardWillShowNotification() {
        self.addNotificationObserver(UIKeyboardWillShowNotification, selector: "keyboardWillShowNotification:");
    }
    
    func addKeyboardDidShowNotification() {
        self.addNotificationObserver(UIKeyboardDidShowNotification, selector: "keyboardDidShowNotification:");
    }
    
    func addKeyboardWillHideNotification() {
        self.addNotificationObserver(UIKeyboardWillHideNotification, selector: "keyboardWillHideNotification:");
    }
    
    func addKeyboardDidHideNotification() {
        self.addNotificationObserver(UIKeyboardDidHideNotification, selector: "keyboardDidHideNotification:");
    }
    
    func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(UIKeyboardWillShowNotification);
    }
    
    func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(UIKeyboardDidShowNotification);
    }
    
    func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(UIKeyboardWillHideNotification);
    }
    
    func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(UIKeyboardDidHideNotification);
    }
    
    func keyboardDidShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidShowWithFrame(frame!)
    }
    
    func keyboardWillShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillShowWithFrame(frame!)
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillHideWithFrame(frame!)
    }
    
    func keyboardDidHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidHideWithFrame(frame!)
    }
    
    func keyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    func keyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    func keyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    func keyboardDidHideWithFrame(frame: CGRect) {
        
    }

    // MARK: - VC Container

    /// EZSwiftExtensions
    var top: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.top
            }
            if let nav = self.navigationController {
                if nav.navigationBarHidden {
                    return view.top
                } else {
                    return nav.navigationBar.bottom
                }
            } else {
                return view.top
            }
        }
    }
    
    /// EZSwiftExtensions
    var bottom: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.bottom
            }
            if let tab = tabBarController {
                if tab.tabBar.hidden {
                    return view.bottom
                } else {
                    return tab.tabBar.top
                }
            } else {
                return view.bottom
            }
        }
    }
    
    /// EZSwiftExtensions
    var tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }
    
    /// EZSwiftExtensions
    var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            return 0
        }
    }
    
    /// EZSwiftExtensions
    var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
    
    /// EZSwiftExtensions
    var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
    
    /// EZSwiftExtensions
    var applicationFrame: CGRect {
        get {
            return CGRect(x: view.x, y: top, width: view.w, height: bottom - top)
        }
    }
    
    // MARK: - VC Flow

    /// EZSwiftExtensions
    func pushVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// EZSwiftExtensions
    func popVC() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    /// EZSwiftExtensions
    func presentVC(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
    /// EZSwiftExtensions
    func dismissVC(completion completion: (() -> Void)? ) {
        dismissViewControllerAnimated(true, completion: completion)
    }
}

