//
//  UIImageViewExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIImageView {

    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        image = UIImage(named: imageName)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions, scales this ImageView size to fit the given width
    func scaleImageFrameToWidth(width width: CGFloat) {
        let widthRatio = image!.size.width / width
        let newWidth = image!.size.width / widthRatio
        let newHeigth = image!.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
    /// EZSwiftExtensions
    func roundSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    /// EZSwiftExtensions
    func imageWithUrl(url url: String) {
        requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }
    
    /// EZSwiftExtensions
    func imageWithUrl(url url: String, placeholder: UIImage) {
        self.image = placeholder
        requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }
    
    /// EZSwiftExtensions
    func imageWithUrl(url url: String, placeholderNamed: String) {
        self.image = UIImage(named: placeholderNamed)
        requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }

}

