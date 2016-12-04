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
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupViewControllers() {
        nav = UINavigationController(rootViewController: rootVC)
        nav.pushViewController(vc2, animated: false)
        nav.pushViewController(vc3, animated: false)
    }
    
    func testPopToRoot() {
        setupViewControllers()
        
        vc3.popToRootVC()
        let root = nav.viewControllers.first
        XCTAssertEqual(root, rootVC)
    }
    
    func testPopVC() {
        setupViewControllers()
        
        vc3.popVC()
        let pop = nav.viewControllers[1]
        XCTAssertEqual(pop, vc2)
    }
}

