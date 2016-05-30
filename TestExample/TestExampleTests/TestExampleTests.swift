//
//  TestExampleTests.swift
//  TestExampleTests
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import XCTest
@testable import TestExample

class TestExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let nilVariable:String? = nil
        let notNilVariable:String? = "This is something"
        let trueBool:Bool = true
        let falseBool:Bool = false
        
        XCTAssert(1+1==2)
        XCTAssert(1+1==2, "Something is wrong with math")
        
        XCTAssertNil(nilVariable)
        XCTAssertNil(nilVariable, "This variable must be nil")
        
        XCTAssertTrue(trueBool)
        XCTAssertTrue(trueBool, "This expression must be true")
        
        XCTAssertFalse(falseBool)
        XCTAssertFalse(falseBool, "This expression must be false")
        
        XCTAssertNotNil(notNilVariable)
        XCTAssertNotNil(notNilVariable, "This variable have value")
        
        XCTAssertEqual(3+2, 4+1)
        XCTAssertLessThan(3, 4)
        XCTAssertNotEqual(3, 4)
        XCTAssertGreaterThan(5, 4)
       // XCTAssertThrowsError(expression: T, message: String, errorHandler: (error: ErrorType) -> Void)
       // XCTFail("Force failure") 
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
