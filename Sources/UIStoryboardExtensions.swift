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

	/// EZSE: Get view controller from storyboard by its class type
	/// Usage: let profileVC = storyboard!.instantiateVC(ProfileViewController) /* profileVC is of type ProfileViewController */
	/// Warning: identifier should match storyboard ID in storyboard of identifier class
	public func instantiateVC<T>(identifier: T.Type) -> T {
		let storyboardID = String(identifier)
		return instantiateViewControllerWithIdentifier(storyboardID) as! T
	}
}
