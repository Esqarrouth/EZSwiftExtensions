//
//  BlockButton.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//
import UIKit

public typealias BlockButtonAction = (sender: BlockButton) -> Void

///Make sure you use  "[weak self] (sender) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockButton: UIButton {
    // MARK: Propeties

    public var highlightLayer: CALayer?
    public var action: BlockButtonAction?

    // MARK: Init

    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        defaultInit()
    }

    public init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: w, height: h))
        defaultInit()
    }

    public init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, action: BlockButtonAction?) {
        super.init (frame: CGRect(x: x, y: y, width: w, height: h))
        self.action = action
        defaultInit()
    }

    public init(action: BlockButtonAction) {
        super.init(frame: CGRect.zero)
        self.action = action
        defaultInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }

    public init(frame: CGRect, action: BlockButtonAction) {
        super.init(frame: frame)
        self.action = action
        defaultInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func defaultInit() {
        addTarget(self, action: #selector(BlockButton.didPressed(_:)), for: UIControlEvents.touchUpInside)
        addTarget(self, action: #selector(BlockButton.highlight), for: [UIControlEvents.touchDown, UIControlEvents.touchDragEnter])
        addTarget(self, action: #selector(BlockButton.unhighlight), for: [
            UIControlEvents.touchUpInside,
            UIControlEvents.touchUpOutside,
            UIControlEvents.touchCancel,
            UIControlEvents.touchDragExit
        ])
        setTitleColor(UIColor.black(), for: UIControlState())
        setTitleColor(UIColor.blue(), for: UIControlState.selected)
    }

    public func addAction(_ action: BlockButtonAction) {
        self.action = action
    }

    // MARK: Action

    public func didPressed(_ sender: BlockButton) {
        action?(sender: sender)
    }

    // MARK: Highlight

    public func highlight() {
        if action == nil {
            return
        }
        let highlightLayer = CALayer()
        highlightLayer.frame = layer.bounds
        highlightLayer.backgroundColor = UIColor.black().cgColor
        highlightLayer.opacity = 0.5
        var maskImage: UIImage? = nil
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            maskImage = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        let maskLayer = CALayer()
        maskLayer.contents = maskImage?.cgImage
        maskLayer.frame = highlightLayer.frame
        highlightLayer.mask = maskLayer
        layer.addSublayer(highlightLayer)
        self.highlightLayer = highlightLayer
    }

    public func unhighlight() {
        if action == nil {
            return
        }
        highlightLayer?.removeFromSuperlayer()
        highlightLayer = nil
    }
}
