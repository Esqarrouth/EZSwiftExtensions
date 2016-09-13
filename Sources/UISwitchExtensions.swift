//
//  UISwitchExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 4/22/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import UIKit

#if os(iOS)

extension UISwitch {

	/// EZSE: toggles Switch
	public func toggle() {
		self.setOn(!self.isOn, animated: true)
	}
}

#endif
