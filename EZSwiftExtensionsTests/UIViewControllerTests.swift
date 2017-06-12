//
//  UIViewControllerTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UIViewControllerTests: XCTestCase {

    private var nav:UINavigationController!
    private let rootVC  = UIViewController()
    private let vc2     = UIViewController()
    private let vc3     = UIViewController()
    
    override func setUp() {
        super.setUp()
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

    func testIsNavBarHidden() {
        let vc  = UIViewController()
        _ = UINavigationController(rootViewController: vc)
        
        vc.isNavBarHidden = true
        let isHidden = vc.navigationController?.isNavigationBarHidden
        XCTAssertTrue(isHidden!)
        
        vc.isNavBarHidden = false
        let isHiddenNotHidden = vc.navigationController?.isNavigationBarHidden
        XCTAssertFalse(isHiddenNotHidden!)
    }
}

#endif

