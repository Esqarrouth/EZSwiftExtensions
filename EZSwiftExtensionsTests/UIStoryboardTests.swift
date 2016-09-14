//
//  UIStoryboardTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
import AVKit
@testable import EZSwiftExtensions

class UIStoryboardTests: XCTestCase {

    var storyboard: UIStoryboard!

    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMainStoryboard() {
        //TODO: mainStoryboard will always return nil, thus it refers to mainBundle instead of NSBundle(forClass: self.dynamicType)
    }

    func testIntialVC() {
        let initialVC = storyboard.initialVC
        let expectedInitialVC = storyboard.instantiateInitialViewController()
        XCTAssertTrue(initialVC!.isMemberOfClass(expectedInitialVC!.dynamicType))
        XCTAssertEqual(initialVC?.title, "Initial View Controller")
    }

    func testInstantiateVC() {
        let navigationVC = storyboard.instantiateVC(UINavigationController)
        XCTAssertNotNil(navigationVC)
        let detailVC = storyboard.instantiateVC(DetailedViewController)
        XCTAssertNotNil(detailVC)
        //let fakeVC = storyboard.instantiateVC(AVPlayerViewController)
        //XCTAssertNil(fakeVC)
    }

}
