//
//  UIStackViewTests.swift
//  EZSwiftExtensions
//
//  Created by Kenza Iraki on 2017-03-12.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UIStackViewTests: XCTestCase {

	var stackView: UIStackView!

	override func setUp() {
		super.setUp()
		self.stackView = UIStackView()
	}

	override func tearDown() {
		super.tearDown()
	}

	func testConvenienceInit() {
		let customInitSV = UIStackView(distribution: .fill,
		                               alignment: .center,
		                               axis: .vertical,
		                               spacing: 5)
		XCTAssertEqual(customInitSV.distribution, .fill)
		XCTAssertEqual(customInitSV.alignment, .center)
		XCTAssertEqual(customInitSV.axis, .vertical)
		XCTAssertEqual(customInitSV.spacing, 5)
	}

	func testAddSubviews() {
		stackView.addArrangedSubviews(UIView(), UIView(), UIView(), UIView())
		XCTAssertEqual(stackView.subviews.count, 4)
	}

}

#endif
