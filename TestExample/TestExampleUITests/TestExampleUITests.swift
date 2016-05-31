//
//  TestExampleUITests.swift
//  TestExampleUITests
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import XCTest

class TestExampleUITests: XCTestCase {
    
    var app:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        
        app = XCUIApplication()
        app.launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample()
    {

        addUIInterruptionMonitorWithDescription("Location Dialog") { (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
      
       
        let goNextButton = app.buttons["Go Next"]
        
        // 1. in case we always have welcome
        /*
        waitForElementToAppear(goNextButton)
        goNextButton.tap()
        
         */
        
        // 2. In case welcome is shown only once
        if waitUntilElementExists( goNextButton , timeout: 5) {
            goNextButton.tap()
        }
 
        
        waitForElementToAppear(app.staticTexts["Cool application"])
        app.tap()
        
        sleep(5)
        
    }
    
}
