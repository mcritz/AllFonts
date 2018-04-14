//
//  All_FontsTests.swift
//  All FontsTests
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import XCTest
@testable import All_Fonts

class All_FontsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFontInfo() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let testFontInfo = FontInfo()
        XCTAssertGreaterThan(testFontInfo.allFontFamilies.count, 0)
        XCTAssertEqual(testFontInfo.fontFamilies.count, 0)
    }
    
    func testMakeFontFamily() {
        let testFontInfoController = FontInfoController()
        let testFamilyName = "FooBar"
        let fooBarFamily = testFontInfoController.makeFontFamily(with: testFamilyName)
        XCTAssertEqual(fooBarFamily.name, testFamilyName, "Font family should exist with the same name.")
        XCTAssertEqual(fooBarFamily.fonts.count, 0, "There should be no fonts for font family 'FooBar'.")
        let helveticaFamily = testFontInfoController.makeFontFamily(with: "Helvetica")
        XCTAssertGreaterThan(helveticaFamily.fonts.count, 0, "There should be fonts in Helvetica family")
    }
    
    func testGetFamilies() {
        let familes = ["Arial", "Helvetica"]
        let testFontInfoController = FontInfoController()
        let result = testFontInfoController.getFamiles(from: familes)
        XCTAssertEqual(result.count, familes.count)
    }
    
    func testPerformanceGetFamilies() {
        self.measure {
            let testFontInfoController = FontInfoController()
            _ = testFontInfoController.summary()
        }
    }
    
}
