//
//  BlockLongPress.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

public class BlockLongPress: UILongPressGestureRecognizer {
    
    private var longPressAction: ((UILongPressGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UILongPressGestureRecognizer) -> Void)?) {
        self.init()
        longPressAction = action
        addTarget(self, action: "didLongPressed:")
    }
    
    public func didLongPressed (longPress: UILongPressGestureRecognizer) {
        longPressAction? (longPress)
    }
}
