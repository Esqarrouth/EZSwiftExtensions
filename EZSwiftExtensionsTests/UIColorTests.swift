//
//  UIColorTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import EZSwiftExtensions

class UIColorTests: XCTestCase {

	var color: UIColor!

	override func setUp() {
		super.setUp()
		color = UIColor.blue
	}

	func testInitRGBValues() {
		color = UIColor(r: 255, g: 255, b: 255)
		let red = color.cgColor.components?[0]
		XCTAssertEqual(red, 1)
	}

	func testInitHexString() {
		color = UIColor(hexString: "ff0000")
		let red = color.cgColor.components?[0]
		let green = color.cgColor.components?[1]
		let blue = color.cgColor.components?[2]

		XCTAssertEqual(red, 1)
		XCTAssertEqual(blue, 0)
		XCTAssertEqual(green, 0)
	}

	func testInitGray() {
		color = UIColor(gray: 100)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        XCTAssertTrue(color.getRed(&red, green: &green, blue: &blue, alpha: nil))
        
		let gray = Double(0.299 * red + 0.587 * green + 0.114 * blue).getRoundedByPlaces(7)
		let testGray = (100 / 255).getRoundedByPlaces(7)
		XCTAssertEqual(gray, testGray)
	}

	func testRedComponent() {
		color = UIColor.red
		XCTAssertEqual(color.redComponent, 255)
	}

	func testGreenComponent() {
		color = UIColor.green
		XCTAssertEqual(color.greenComponent, 255)
	}

	func testBlueComponent() {
		color = UIColor.blue
		XCTAssertEqual(color.blueComponent, 255)
	}

	func testAlpha() {
		color = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
		XCTAssertEqual(color.alpha, 0.5)
	}

}
