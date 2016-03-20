//
//  UIImageExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIImage {
    
    /// EZSE: Returns compressed image to rate from 0 to 1
    public func compressImage(rate rate: CGFloat) -> NSData {
        let compressedImage = UIImageJPEGRepresentation(self, rate)
        return compressedImage!
    }
    
    /// EZSE: Returns Image size in Bytes
    public func getSizeAsBytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length
    }
    
    /// EZSE: Returns Image size in Kylobites
    public func getSizeAsKilobytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length / 1024
    }

    /// EZSE: scales image 
    public class func scaleTo(image image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// EZSE Returns resized image with width. Might return low quality
    public func resizeWithWidth(width: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: width, height: aspectHeightForWidth(width))
    
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    /// EZSE Returns resized image with height. Might return low quality
    public func resizeWithHeight(height: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: aspectWidthForHeight(height), height: height)
        
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img
    }
    
    /// EZSE:
    public func aspectHeightForWidth(width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    /// EZSE:
    public func aspectWidthForHeight(height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    /// EZSE: Returns cropped image from CGRect
    public func croppedImage(bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print("EZSE: Your cropping X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print("EZSE: Your cropping Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        let croppedImage: UIImage = UIImage(CGImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.Up)
        return croppedImage
    }
    
    ///EZSE: Returns the image associated with the URL
    public convenience init?(urlString: String) {
        guard let url = NSURL(string: urlString) else {
            self.init(data: NSData())
            return
        }
        guard let data = NSData(contentsOfURL: url) else {
            print("EZSE: No image in URL")
            self.init(data: NSData())
            return
        }
        self.init(data: data)
    }
    
    ///EZSE: Returns an empty image //TODO: Add to readme
    public class func blankImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
