//
//  UIImageTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import XCTest
@testable import EZSwiftExtensions

class UIImageTests: XCTestCase {
    
    func testBase64() {
        let testBundle = Bundle(for: type(of: self))
        let imageURL = testBundle.url(forResource: "charizard", withExtension: "jpg")
        let dataImage = try? Data(contentsOf: imageURL!)
        let image = UIImage(data: dataImage!)
        let decodedData = Data(base64Encoded: image!.base64)
        XCTAssertNotNil(decodedData)
    }
}

#endif
