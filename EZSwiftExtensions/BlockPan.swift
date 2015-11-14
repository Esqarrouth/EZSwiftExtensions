//
//  BlockPan.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

class BlockPan: UIPanGestureRecognizer {
    
    private var panAction: ((UIPanGestureRecognizer) -> Void)?
    
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    convenience init (action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.panAction = action
        self.addTarget(self, action: "didPan:")
    }
    
    func didPan (pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
}
