//
//  BlockButtonTests.swift
//  EZSwiftExtensions
//
//  Created by Valentino Urbano on 28/01/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class BlockButtonTests: XCTestCase {
    var blockButton: BlockButton!

    override func setUp() {
        super.setUp()
        blockButton = BlockButton()
    }

    func testHighlight() {
        blockButton.highlight()
        guard let _ = blockButton.action else {
            XCTAssertNil(blockButton.highlightLayer)
            return
        }
        XCTAssertNotNil(blockButton.highlightLayer)
    }

    func testUnighlight() {
        blockButton.unhighlight()
        XCTAssertNil(blockButton.highlightLayer)
    }
}
