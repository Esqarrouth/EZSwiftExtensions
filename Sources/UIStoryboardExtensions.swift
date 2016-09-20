//
//  UIStoryboardExtensions.swift
//  EZSwiftExtensions
//
//  Created by Rugen Heidbuchel on 15/06/2016.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension UIStoryboard {

	/// EZSE: Get the application's main storyboard
	/// Usage: let storyboard = UIStoryboard.mainStoryboard
	public static var mainStoryboard: UIStoryboard? {
		let bundle = Bundle.main
		guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
			return nil
		}
		return UIStoryboard(name: name, bundle: bundle)
	}

	/// EZSE: Get view controller from storyboard by its class type
	/// Usage: let profileVC = storyboard!.instantiateVC(ProfileViewController) /* profileVC is of type ProfileViewController */
	/// Warning: identifier should match storyboard ID in storyboard of identifier class
	public func instantiateVC<T>(_ identifier: T.Type) -> T? {
		let storyboardID = String(describing: identifier)
		if let vc = instantiateViewController(withIdentifier: storyboardID) as? T {
			return vc
		} else {
			return nil
		}
	}
}
