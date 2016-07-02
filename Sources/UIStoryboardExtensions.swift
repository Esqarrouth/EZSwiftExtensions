//
//  UIStoryboardExtensions.swift
//  EZSwiftExtensions
//
//  Created by Rugen Heidbuchel on 15/06/2016.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

public extension UIStoryboard {

	/// EZSE: Get the application's main storyboard
	/// Usage: let storyboard = UIStoryboard.mainStoryboard
	public static var mainStoryboard: UIStoryboard? {
		let bundle = NSBundle.mainBundle()
		guard let key = bundle.objectForInfoDictionaryKey("UIMainStoryboardFile") as? String else {
			return nil
		}
		return UIStoryboard(name: key, bundle: bundle)
	}
}
