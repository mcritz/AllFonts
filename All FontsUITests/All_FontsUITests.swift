//
//  All_FontsUITests.swift
//  All FontsUITests
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import XCTest

class All_FontsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let allFontsWindow = XCUIApplication().windows["All Fonts"]
        XCTAssert(allFontsWindow/*@START_MENU_TOKEN@*/.staticTexts["Available fontz"]/*[[".staticTexts[\"Font Families: 253\\nFont Faces: 692\"]",".staticTexts[\"Available fonts\"]",".staticTexts[\"Available fontz\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(allFontsWindow.buttons["Save"].exists)
        
        
    }
    
}
