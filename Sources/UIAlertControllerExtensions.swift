//
//  UIAlertControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 23/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//
import UIKit

extension UIAlertController {
    /// EZSE: Easy way to present UIAlertController
    func show() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
}
