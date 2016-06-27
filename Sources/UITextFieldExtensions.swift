//
//  UITextFieldExtensions.swift
//  EZSwiftExtensions
//
//  Created by Wang Yu on 6/26/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension UITextField {
    /// EZSwiftExtensions: Automatically sets these values: backgroundColor = clearColor, textColor = ThemeNicknameColor, clipsToBounds = true,
    /// textAlignment = Left, userInteractionEnabled = true, editable = false, scrollEnabled = false, font = ThemeFontName, fontsize = 17
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, w: w, h: h, fontSize: 17)
    }
    
    /// EZSwiftExtensions: Automatically sets these values: backgroundColor = clearColor, textColor = ThemeNicknameColor, clipsToBounds = true,
    /// textAlignment = Left, userInteractionEnabled = true, editable = false, scrollEnabled = false, font = ThemeFontName
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fontSize: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        font = UIFont.HelveticaNeue(type: FontType.None, size: fontSize)
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        textAlignment = NSTextAlignment.Left
        userInteractionEnabled = true
    }
    
    /// EZSE: Add left padding to the text in textfield
    func addLeftTextPadding(blankSize: CGFloat) {
        let leftView = UIView()
        leftView.frame = CGRectMake(0, 0, blankSize, self.frame.height)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.Always
    }
    
    /// EZSE: Add a image icon on the left side of the textfield
    func addLeftIcon(image: UIImage?, frame: CGRect, imageSize: CGSize) {
        let leftView = UIView()
        leftView.frame = frame
        let imgView = UIImageView()
        imgView.frame = CGRectMake(frame.width - 8 - imageSize.width, (frame.height - imageSize.height) / 2, imageSize.width, imageSize.height)
        imgView.image = image
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.Always
    }

}
