//
//  BlockPinch.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

class BlockPinch: UIPinchGestureRecognizer {
   
    private var pinchAction: ((UIPinchGestureRecognizer) -> Void)?
    
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    convenience init (action: ((UIPinchGestureRecognizer) -> Void)?) {
        self.init()
        self.pinchAction = action
        self.addTarget(self, action: "didPinch:")
    }
    
    func didPinch (pinch: UIPinchGestureRecognizer) {
        pinchAction? (pinch)
    }

}
