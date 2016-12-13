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

    func testIsNavBarHidden() {
        let vc  = UIViewController()
        _ = UINavigationController(rootViewController: vc)
        vc.isNavBarHidden = true
        let isHidden = vc.navigationController?.isNavigationBarHidden
        XCTAssertEqual(true, isHidden)
        
        vc.isNavBarHidden = false
        XCTAssertEqual(vc.isNavBarHidden, false)
    }

}

