//
//  TestExampleUITests.swift
//  TestExampleUITests
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import XCTest

class TestExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        
        let app = XCUIApplication()
        app.launchArguments += ["UI-TESTING"]
        app.launchEnvironment["http://plantronics.com/api/masterlist.json"] = "{\"element\": 3 }"
        app.launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssert(true)
    }
    
}
