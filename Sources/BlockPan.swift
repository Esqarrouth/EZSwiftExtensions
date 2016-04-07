//
//  BlockPan.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockPan: UIPanGestureRecognizer {
    private var panAction: ((UIPanGestureRecognizer) -> Void)?

    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }

    public convenience init (action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.panAction = action
        self.addTarget(self, action: #selector(BlockPan.didPan(_:)))
    }

    public func didPan (pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
}
