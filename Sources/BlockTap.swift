//
//  BlockTap.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

public class BlockTap: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        tapCount: Int,
        fingerCount: Int,
        action: ((UITapGestureRecognizer) -> Void)?) {
            self.init()
            self.numberOfTapsRequired = tapCount
            self.numberOfTouchesRequired = fingerCount
            self.tapAction = action
            self.addTarget(self, action: "didTap:")
    }
    
    public func didTap (tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
    
}
