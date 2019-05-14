//
//  UIStackViewExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Kenza Iraki on 2017-03-12.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//
// swiftlint:disable line_length

#if os(iOS) || os(tvOS)

import UIKit

@available(iOS 9.0, *)
extension UIStackView {

	/// EZSwiftExtensions: Convenience initializer in order to directly pass the distribution, alignment, axis and spacing of the stack view.
	///
	/// - Parameters:
	///   - distribution: the distribution of the stack view
	///   - alignment: the alignment of the stack view
	///   - axis: the axis (e.g. horizontal or vertical)
	///   - spacing: spacing between subviews, default is 0
    public convenience init(distribution: UIStackView.Distribution,
                            alignment: UIStackView.Alignment,
                            axis: NSLayoutConstraint.Axis,
	                        spacing: CGFloat = 0) {
		self.init()
		self.distribution = distribution
		self.alignment = alignment
		self.axis = axis
		self.spacing = spacing
	}

	/// EZSwiftExtensions: Add multiple subviews at once. They will be added in order (top to bottom for a vertical stack view and left to right for a vertical stack view)
	///
	/// - Parameter views: array of views to add
	public func addArrangedSubviews(_ views: UIView...) {
		for view in views {
			self.addArrangedSubview(view)
		}
	}

}

#endif
