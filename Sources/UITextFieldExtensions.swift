//
//  UITextFieldExtensions.swift
//  EZSwiftExtensions
//
//  Created by Wang Yu on 6/26/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

extension UITextField {
    /// EZSE: Regular exp for email
    static let emailRegex = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    

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
        backgroundColor = UIColor.clear
        clipsToBounds = true
        textAlignment = NSTextAlignment.left
        isUserInteractionEnabled = true
    }

    /// EZSE: Add left padding to the text in textfield
    public func addLeftTextPadding(_ blankSize: CGFloat) {
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: blankSize, height: frame.height)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.always
    }

    /// EZSE: Add a image icon on the left side of the textfield
    public func addLeftIcon(_ image: UIImage?, frame: CGRect, imageSize: CGSize) {
        let leftView = UIView()
        leftView.frame = frame
        let imgView = UIImageView()
        imgView.frame = CGRect(x: frame.width - 8 - imageSize.width, y: (frame.height - imageSize.height) / 2, w: imageSize.width, h: imageSize.height)
        imgView.image = image
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.always
    }

    /// EZSE: Ways to validate by comparison
    enum textFieldValidationOptions: Int {
        case equalTo
        case greaterThan
        case greaterThanOrEqualTo
        case lessThan
        case lessThanOrEqualTo
    }
    
    /// EZSE: Validation length of character counts in UITextField
    func validateLength(ofCount count: Int, option: UITextField.textFieldValidationOptions) -> Bool {
        switch option {
        case .equalTo:
            return self.text!.characters.count == count
        case .greaterThan:
            return self.text!.characters.count > count
        case .greaterThanOrEqualTo:
            return self.text!.characters.count >= count
        case .lessThan:
            return self.text!.characters.count < count
        case .lessThanOrEqualTo:
            return self.text!.characters.count <= count
        }
    }

    /// EZSE: Validation of email format based on https://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address and https://stackoverflow.com/questions/2049502/what-characters-are-allowed-in-an-email-address
    // TODO match String.isEmail method
    func validateEmail() -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", UITextField.emailRegex)
        return emailTest.evaluate(with: self.text)
    }
    
    /// EZSE: Validation of digits only
    func validateDigits() -> Bool {
        let digitsRegEx = "[0-9]*"
        let digitsTest = NSPredicate(format:"SELF MATCHES %@", digitsRegEx)
        return digitsTest.evaluate(with: self.text)
    }
}
#endif