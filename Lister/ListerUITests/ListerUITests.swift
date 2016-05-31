//
//  ListerUITests.swift
//  ListerUITests
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import XCTest

class ListerUITests: XCTestCase {
        
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
    
        let app = XCUIApplication()
        let table = app.tables
        table.staticTexts["Groceries"].tap()
        
        let addItemTestField = table.textFields["Add Item"]
        addItemTestField.tap()
        addItemTestField.typeText("Cookies")
        app.typeText("\r")
        
        table.buttons["Cookies"].tap()
        let groceriesNavigatinBar = app.navigationBars.matchingIdentifier("Groceries")
        groceriesNavigatinBar.buttons["Edit"].tap()
        
        
        table.cells.containingType(.Button, identifier:"Cookies").buttons["Delete "].tap()
        table.buttons["Delete"].tap()
        
        
        groceriesNavigatinBar.buttons["Done"].tap()
        
    }
    
}