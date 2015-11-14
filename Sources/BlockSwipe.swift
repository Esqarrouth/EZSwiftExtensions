//
//  BlockSwipe.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

class BlockSwipe: UISwipeGestureRecognizer {
    
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    convenience init (direction: UISwipeGestureRecognizerDirection,
        fingerCount: Int,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction
            numberOfTouchesRequired = fingerCount
            swipeAction = action
            addTarget(self, action: "didSwipe:")
    }
    
    func didSwipe (swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}

