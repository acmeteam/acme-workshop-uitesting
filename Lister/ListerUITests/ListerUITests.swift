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
    /**
     Test adding, selecting and removing
     */
    func testAddingCookies() {
    
        let app = XCUIApplication()
        let table = app.tables
        table.staticTexts["Groceries"].tap()
        
        let addItemTestField = table.textFields["Add Item"]
        addItemTestField.tap()
        addItemTestField.typeText("Cookies")
        app.typeText("\r")
        
        let cookiesButton = table.buttons["Cookies"]
        
        
        XCTAssertEqual(cookiesButton.value as? String, "0")
        cookiesButton.tap() // po cookiesButton.value, before and after tap.
        XCTAssertEqual(cookiesButton.value as? String, "1")
        
        let groceriesNavigatinBar = app.navigationBars.matchingIdentifier("Groceries")
        groceriesNavigatinBar.buttons["Edit"].tap()
        
        
        table.cells.containingType(.Button, identifier:"Cookies").buttons["Delete "].tap()
        table.buttons["Delete"].tap()
        
        
        groceriesNavigatinBar.buttons["Done"].tap()
        
        XCTAssertEqual(cookiesButton.exists, false)
        
    }
    /**
     Test adding two same items
     */
    func testAddTwoCookies() {
        
        let app = XCUIApplication()
        let table = app.tables
        table.staticTexts["Groceries"].tap()
        
        let addItemTestField = table.textFields["Add Item"]
        addItemTestField.tap()
        addItemTestField.typeText("Cookies")
        app.typeText("\r")
        
        let cookiesButton = table.buttons["Cookies"]
        
        
        XCTAssertEqual(cookiesButton.value as? String, "0")
        cookiesButton.tap() // po cookiesButton.value, before and after tap.
        XCTAssertEqual(cookiesButton.value as? String, "1")
        
        
        addItemTestField.tap()
        addItemTestField.typeText("Cookies")
        app.typeText("\r")
        
        
        // we have 2 buttons with identifier Cookies here. One way of fixin....
        let cookiesButton2 = table.childrenMatchingType(.Cell).elementBoundByIndex(1).buttons["Cookies"]
        cookiesButton2.tap() // po cookiesButton.value, before and after tap.
    }
    
    func testRemoveAllItems() {
        let app = XCUIApplication()
        let table = app.tables
        table.staticTexts["Groceries"].tap()
        app.navigationBars.matchingIdentifier("Groceries").buttons["Edit"].tap()
        
        while table.cells.count > 1 {
            let count = table.cells.count
            let cell = table.cells.elementBoundByIndex(1)
            cell.buttons.matchingPredicate(NSPredicate(format: "label BEGINSWITH 'Delete'")).element.tap()
            cell.childrenMatchingType(.Button).matchingIdentifier("Delete").elementBoundByIndex(0).tap()
            XCTAssertEqual(table.cells.count, count-1)
        }
    }
    
}
