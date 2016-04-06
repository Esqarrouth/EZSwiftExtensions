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
    public func addNotificationObserver(name: String, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }

    public func removeNotificationObserver(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }

    public func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    public func addKeyboardWillShowNotification() {
        self.addNotificationObserver(UIKeyboardWillShowNotification, selector: #selector(UIViewController.keyboardWillShowNotification(_:)))
    }

    public func addKeyboardDidShowNotification() {
        self.addNotificationObserver(UIKeyboardDidShowNotification, selector: #selector(UIViewController.keyboardDidShowNotification(_:)))
    }

    public func addKeyboardWillHideNotification() {
        self.addNotificationObserver(UIKeyboardWillHideNotification, selector: #selector(UIViewController.keyboardWillHideNotification(_:)))
    }

    public func addKeyboardDidHideNotification() {
        self.addNotificationObserver(UIKeyboardDidHideNotification, selector: #selector(UIViewController.keyboardDidHideNotification(_:)))
    }

    public func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(UIKeyboardWillShowNotification)
    }

    public func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(UIKeyboardDidShowNotification)
    }

    public func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(UIKeyboardWillHideNotification)
    }

    public func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(UIKeyboardDidHideNotification)
    }

    public func keyboardDidShowNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo,
            let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {

            let frame = value.CGRectValue()
            keyboardDidShowWithFrame(frame)
        }
    }

    public func keyboardWillShowNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo,
            let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {

            let frame = value.CGRectValue()
            keyboardWillShowWithFrame(frame)
        }
    }

    public func keyboardWillHideNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo,
            let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {

            let frame = value.CGRectValue()
            keyboardWillHideWithFrame(frame)
        }
    }

    public func keyboardDidHideNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo,
            let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {

            let frame = value.CGRectValue()
            keyboardDidHideWithFrame(frame)
        }
    }

    public func keyboardWillShowWithFrame(frame: CGRect) {

    }

    public func keyboardDidShowWithFrame(frame: CGRect) {

    }

    public func keyboardWillHideWithFrame(frame: CGRect) {

    }

    public func keyboardDidHideWithFrame(frame: CGRect) {

    }

    //EZSE: Makes the UIViewController register tap events and hides keyboard when clicked somewhere in the ViewController.
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    public func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - VC Container

    /// EZSwiftExtensions
    public var top: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.top
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
    public var bottom: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.bottom
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
    public var tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }

    /// EZSwiftExtensions
    public var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            return 0
        }
    }

    /// EZSwiftExtensions
    public var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }

    /// EZSwiftExtensions
    public var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }

    /// EZSwiftExtensions
    public var applicationFrame: CGRect {
        get {
            return CGRect(x: view.x, y: top, width: view.w, height: bottom - top)
        }
    }

    // MARK: - VC Flow

    /// EZSwiftExtensions
    public func pushVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }

    /// EZSwiftExtensions
    public func popVC() {
        navigationController?.popViewControllerAnimated(true)
    }

    /// EZSwiftExtensions
    public func presentVC(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }

    /// EZSwiftExtensions
    public func dismissVC(completion completion: (() -> Void)? ) {
        dismissViewControllerAnimated(true, completion: completion)
    }

    /// EZSwiftExtensions
    public func addAsChildViewController(vc: UIViewController, toView: UIView) {
        toView.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMoveToParentViewController(self)
    }

    ///EZSE: Adds image named: as a UIImageView in the Background
    func setBackgroundImage(named: String) {
        let image = UIImage(named: named)
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }

    ///EZSE: Adds UIImage as a UIImageView in the Background
    @nonobjc func setBackgroundImage(image: UIImage) {
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
}
