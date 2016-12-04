//
//  UIViewControllerTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testNavigationBarHidden() {
        let vc  = UIViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        vc.navigationBarHidden(true)
        let isNavBarHidden = vc.navigationController?.isNavigationBarHidden
        XCTAssertEqual(true, isNavBarHidden)
    }

}

