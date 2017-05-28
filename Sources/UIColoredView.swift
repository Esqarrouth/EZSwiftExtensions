//
//  UIColoredView.swift
//  InstaApp
//
//  Created by Goktug Yilmaz on 26/10/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

@available(*, deprecated: 1.8)
class UIColoredView: UIView {
    init() {
        super.init(frame: CGRect(x: 100, y: 100, w: 100, h: 100))
        backgroundColor = UIColor.random()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
