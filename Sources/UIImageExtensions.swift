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
    public func compressImage(rate rate: CGFloat) -> NSData? {
        return UIImageJPEGRepresentation(self, rate)
    }

    /// EZSE: Returns Image size in Bytes
    public func getSizeAsBytes() -> Int {
        return UIImageJPEGRepresentation(self, 1)?.length ?? 0
    }

    /// EZSE: Returns Image size in Kylobites
    public func getSizeAsKilobytes() -> Int {
        let sizeAsBytes = getSizeAsBytes()
        return sizeAsBytes != 0 ? sizeAsBytes / 1024 : 0
    }

    /// EZSE: scales image
    public class func scaleTo(image image: UIImage, w: CGFloat, h: CGFloat) -> UIImage! {
        let size = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage
    }

    /// EZSE Returns resized image with width. Might return low quality
    public func resizeWithWidth(width: CGFloat) -> UIImage! {
        let aspectSize = CGSize (width: width, height: aspectHeightForWidth(width))

        UIGraphicsBeginImageContext(aspectSize)
        drawInRect(CGRect(origin: CGPoint.zero, size: aspectSize))
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return outputImage
    }

    /// EZSE Returns resized image with height. Might return low quality
    public func resizeWithHeight(height: CGFloat) -> UIImage! {
        let aspectSize = CGSize (width: aspectWidthForHeight(height), height: height)

        UIGraphicsBeginImageContext(aspectSize)
        drawInRect(CGRect(origin: CGPoint.zero, size: aspectSize))
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return outputImage
    }

    /// EZSE:
    public func aspectHeightForWidth(width: CGFloat) -> CGFloat {
        return (width * size.height) / size.width
    }

    /// EZSE:
    public func aspectWidthForHeight(height: CGFloat) -> CGFloat {
        return (height * size.width) / size.height
    }

    /// EZSE: Returns cropped image from CGRect
    public func croppedImage(bound: CGRect) -> UIImage? {
        guard size.width > bound.origin.x else {
            print("EZSE: Your cropping X coordinate is larger than the image width")
            return nil
        }
        guard size.height > bound.origin.y else {
            print("EZSE: Your cropping Y coordinate is larger than the image height")
            return nil
        }
        guard let cgImage = CGImage else {
            print("EZSE: UIImage not backde by CGImage")
            return nil
        }
        let scaledBounds: CGRect = CGRect(x: bound.x * scale, y: bound.y * scale, width: bound.w * scale, height: bound.h * scale)
        let imageRef = CGImageCreateWithImageInRect(cgImage, scaledBounds)
        let croppedImage: UIImage = UIImage(CGImage: imageRef!, scale: scale, orientation: UIImageOrientation.Up)
        return croppedImage
    }

    /// EZSE: Use current image for pattern of color
    public func withColor(tintColor: UIColor) -> UIImage! {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("EZSE: Context creation failed")
            return self
        }
        guard let cgImage = CGImage else {
            print("EZSE: UIImage not backde by CGImage")
            return self
        }
        CGContextTranslateCTM(context, 0, size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)

        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        CGContextClipToMask(context, rect, cgImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)

        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return outputImage
    }

    ///EZSE: Returns the image associated with the URL
    public convenience init?(urlString: String) {
        guard let url = NSURL(string: urlString) else {
            self.init(data: NSData())
            return
        }
        guard let data = NSData(contentsOfURL: url) else {
            print("EZSE: No image in URL \(urlString)")
            self.init(data: NSData())
            return
        }
        self.init(data: data)
    }

    ///EZSE: Returns an empty image //TODO: Add to readme
    public class func blankImage() -> UIImage! {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
