//
//  UIImageExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIImage {
    
    /// EZSwiftExtensions - rate: 0 to 1
    public func compressImage(rate rate: CGFloat) -> NSData {
        let compressedImage = UIImageJPEGRepresentation(self, rate)
        return compressedImage!
    }
    
    /// EZSwiftExtensions
    public func getSizeAsBytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length
    }
    
    /// EZSwiftExtensions
    public func getSizeAsKilobytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length / 1024
    }

    /// EZSwiftExtensions
    public class func scaleTo(image image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// EZSwiftExtensions, might return low quality
    public func resizeWithWidth(width: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: width, height: aspectHeightForWidth(width))
    
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    /// EZSwiftExtensions, might return low quality
    public func resizeWithHeight(height: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: aspectWidthForHeight(height), height: height)
        
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img
    }
    
    /// EZSwiftExtensions
    public func aspectHeightForWidth(width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    /// EZSwiftExtensions
    public func aspectWidthForHeight(height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    /// EZSwiftExtensions
    public func croppedImage(bound: CGRect) -> UIImage {
        let scaledBounds: CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        let croppedImage: UIImage = UIImage(CGImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.Up)
        return croppedImage
    }

}
