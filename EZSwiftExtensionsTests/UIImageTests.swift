//
//  UIImageTests.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 8/25/16.
//  Copyright © 2016 Goktug Yilmaz. All rights reserved.
//

import XCTest
@testable import EZSwiftExtensions

class UIImageTests: XCTestCase {

    func testBase64() {
        let testBundle = Bundle(for: type(of: self))
        let imageURL = testBundle.url(forResource: "charizard", withExtension: "jpg")
        let baseURL = testBundle.url(forResource: "base64", withExtension: "txt")

        let dataImage = try? Data(contentsOf: imageURL!)

        let image = UIImage(data: dataImage!)
        let str = try! String(contentsOfFile: baseURL!.path, encoding: String.Encoding.utf8)
        
       XCTAssertEqual(image!.base64, str)
    }

}

