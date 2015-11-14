//
//  BlockSwipe.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

public class BlockSwipe: UISwipeGestureRecognizer {
    
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (direction: UISwipeGestureRecognizerDirection,
        fingerCount: Int,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction
            numberOfTouchesRequired = fingerCount
            swipeAction = action
            addTarget(self, action: "didSwipe:")
    }
    
    public func didSwipe (swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}

