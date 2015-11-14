//
//  BlockButton.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//
import UIKit

typealias BlockButtonAction = (sender: BlockButton) -> Void

class BlockButton: UIButton {
    
    // MARK: Propeties
    
    var highlightLayer: CALayer?
    var action: BlockButtonAction?
    
    // MARK: Init

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        defaultInit()
    }
    
    init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: w, height: h))
        defaultInit()
    }
    
    init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, action: BlockButtonAction?) {
        super.init (frame: CGRect(x: x, y: y, width: w, height: h))
        self.action = action
        defaultInit()
    }
    
    init(action: BlockButtonAction) {
        super.init(frame: CGRectZero)
        self.action = action
        defaultInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }
    
    init(frame: CGRect, action: BlockButtonAction) {
        super.init(frame: frame)
        self.action = action
        defaultInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    private func defaultInit() {
        addTarget(self, action: "didPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        addTarget(self, action: "highlight", forControlEvents: [UIControlEvents.TouchDown, UIControlEvents.TouchDragEnter])
        addTarget(self, action: "unhighlight", forControlEvents: [UIControlEvents.TouchUpInside, UIControlEvents.TouchUpOutside, UIControlEvents.TouchCancel, UIControlEvents.TouchDragExit])
    }
    
    func addAction(action: BlockButtonAction) {
        self.action = action
    }
    
    // MARK: Action
    
    func didPressed(sender: BlockButton) {
        action?(sender: sender)
    }
    
    // MARK: Highlight
    
    func highlight() {
        if action == nil {
            return
        }
        let highlightLayer = CALayer()
        highlightLayer.frame = layer.bounds
        highlightLayer.backgroundColor = UIColor.blackColor().CGColor
        highlightLayer.opacity = 0.5
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, false, 0)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let maskImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let maskLayer = CALayer()
        maskLayer.contents = maskImage.CGImage
        maskLayer.frame = highlightLayer.frame
        highlightLayer.mask = maskLayer
        layer.addSublayer(highlightLayer)
        self.highlightLayer = highlightLayer
    }
    
    func unhighlight() {
        if action == nil {
            return
        }
        highlightLayer?.removeFromSuperlayer()
        highlightLayer = nil
    }

}

