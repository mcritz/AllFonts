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
    
    func testUI() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let allFontsWindow = XCUIApplication().windows["All Fonts"]
        XCTAssert(allFontsWindow.exists)
        XCTAssert(allFontsWindow.buttons["Save"].exists)
        
        
        let app = XCUIApplication()
        let menuBarsQuery = app.menuBars
        let fileMenuBarItem = menuBarsQuery.menuBarItems["File"]
        fileMenuBarItem.click()
        XCTAssert(menuBarsQuery/*@START_MENU_TOKEN@*/.menuItems["Save"]/*[[".menuBarItems[\"File\"]",".menus",".menuItems[\"Save…\"]",".menuItems[\"Save\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(menuBarsQuery/*@START_MENU_TOKEN@*/.menuItems["Save"]/*[[".menuBarItems[\"File\"]",".menus",".menuItems[\"Save…\"]",".menuItems[\"Save\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.isEnabled)
    }
    
}
