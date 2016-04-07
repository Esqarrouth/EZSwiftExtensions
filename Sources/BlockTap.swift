//
//  BlockTap.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockTap: UITapGestureRecognizer {
    private var tapAction: ((UITapGestureRecognizer) -> Void)?

    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }

    public convenience init (
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?) {
            self.init()
            self.numberOfTapsRequired = tapCount
            self.numberOfTouchesRequired = fingerCount
            self.tapAction = action
            self.addTarget(self, action: #selector(BlockTap.didTap(_:)))
    }

    public func didTap (tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
}
