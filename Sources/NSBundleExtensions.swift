//
//  NSBundleExtensions.swift
//  EZSwiftExtensions
//
//  Created by chenjunsheng on 15/11/25.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import Foundation

public extension NSBundle {

    /// EZSE: load xib
    //  Usage: Set some UIView subclass as xib's owner class
    //  NSBundle.loadNib("ViewXibName", owner: self) //some UIView subclass
    //  self.addSubview(self.contentView)
    public class func loadNib(name: String, owner: AnyObject!) {
        NSBundle.mainBundle().loadNibNamed(name, owner: owner, options: nil)[0]
    }

    /// EZSE: load xib
    /// Usage: let view: ViewXibName = NSBundle.loadNib("ViewXibName")
    public class func loadNib<T>(name: String) -> T? {
        return NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)[0] as? T
    }

}
