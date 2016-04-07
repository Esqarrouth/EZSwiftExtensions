//
//  BlockSwipe.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockSwipe: UISwipeGestureRecognizer {
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?

    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }

    public convenience init (direction: UISwipeGestureRecognizerDirection,
        fingerCount: Int = 1,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction
            numberOfTouchesRequired = fingerCount
            swipeAction = action
            addTarget(self, action: #selector(BlockSwipe.didSwipe(_:)))
    }

    public func didSwipe (swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}
