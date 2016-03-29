//
//  UISliderExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 3/1/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension UISlider {
    ///EZSE: Slider moving to value with animation duration
    public func setValue(value: Float, duration: Double) {
      UIView.animateWithDuration(duration, animations: { () -> Void in
        self.setValue(self.value, animated: true)
        }) { (bool) -> Void in
          UIView.animateWithDuration(duration, animations: { () -> Void in
            self.setValue(value, animated: true)
            }, completion: nil)
      }
    }
}
