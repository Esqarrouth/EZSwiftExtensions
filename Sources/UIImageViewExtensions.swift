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
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        image = UIImage(named: imageName)
    }

    /// EZSwiftExtensions
    public convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        if image != nil {
            scaleImageFrameToWidth(width: scaleToWidth)
        } else {
            assertionFailure("EZSwiftExtensions Error: The imageName: '\(imageName)' is invalid!!!")
        }
    }

    /// EZSwiftExtensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }

    /// EZSwiftExtensions
    public convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }

    /// EZSwiftExtensions, scales this ImageView size to fit the given width
    public func scaleImageFrameToWidth(width width: CGFloat) {
        guard let image = image else {
            print("EZSwiftExtensions Error: The image is not set yet!")
            return
        }
        let widthRatio = image.size.width / width
        let newWidth = image.size.width / widthRatio
        let newHeigth = image.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }

    /// EZSwiftExtensions, scales this ImageView size to fit the given height
    public func scaleImageFrameToHeight(height height: CGFloat) {
        guard let image = image else {
            print("EZSwiftExtensions Error: The image is not set yet!")
            return
        }
        let heightRatio = image.size.height / height
        let newHeight = image.size.height / heightRatio
        let newWidth = image.size.width / heightRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }

    /// EZSwiftExtensions
    public func roundSquareImage() {
        let image = self.image
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.width).addClip()
        image?.drawInRect(self.bounds)
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    /// EZSwiftExtensions
    public func imageWithUrl(url url: String) {
        imageWithUrlHelper(url.toURL(), placeholderImage: nil)
    }

    /// EZSwiftExtensions
    public func imageWithUrl(url url: String, placeholder: UIImage) {
        imageWithUrlHelper(url.toURL(), placeholderImage: placeholder)
    }

    /// EZSwiftExtensions
    public func imageWithUrl(url url: String, placeholderNamed: String) {
        imageWithUrlHelper(url.toURL(), placeholderImage: UIImage(named: placeholderNamed))
    }
    
    private func imageWithUrlHelper(url: NSURL?, placeholderImage: UIImage?) {
        if let placeholder = placeholderImage {
            self.image = placeholder
        }
        if let urlString = url?.absoluteString {
            ImageLoader.sharedInstance.imageForUrl(urlString) { [weak self] image, url in
                if let strongSelf = self {
                    dispatch_async(dispatch_get_main_queue()) {
                        if urlString == url {
                            strongSelf.image = image ?? placeholderImage
                        }
                    }
                }
            }
        }
    }
}
