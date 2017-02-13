//
//  DataExtensions.swift
//  EZSwiftExtensions
//
//  Created by Sanyal, Arunav on 2/12/17.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension Data {
    
    /// EZSE : Attributed string from data
    /// Found it here : http://stackoverflow.com/questions/39248092/nsattributedstring-extension-in-swift-3
    public var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error {
            NSLog(error.localizedDescription)
        }
        return nil
    }
}
