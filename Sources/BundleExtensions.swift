//
//  BundleExtensions.swift
//  EZSwiftExtensions
//
//  Created by chenjunsheng on 15/11/25.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import Foundation

public extension Bundle {

    #if os(iOS) || os(tvOS)
    /// EZSE: load xib
    //  Usage: Set some UIView subclass as xib's owner class
    //  Bundle.loadNib("ViewXibName", owner: self) //some UIView subclass
    //  self.addSubview(self.contentView)
    public class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }

    /// EZSE: load xib
    /// Usage: let view: ViewXibName = Bundle.loadNib("ViewXibName")
    public class func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
    #endif
}
