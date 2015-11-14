//
//  BlockPan.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

public class BlockPan: UIPanGestureRecognizer {
    
    private var panAction: ((UIPanGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.panAction = action
        self.addTarget(self, action: "didPan:")
    }
    
    public func didPan (pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
}
