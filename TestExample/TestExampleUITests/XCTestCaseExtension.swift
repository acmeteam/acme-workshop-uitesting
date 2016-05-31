//
//  XCTestCaseExtension.swift
//  TestingExamples
//
//  Created by Andrija Milovanovic on 5/30/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import Foundation
import XCTest


extension XCTestCase
{
    /* Extending system TC class to provide functionality to wait for object to appear. Failure if element does not appear.
     */
    func waitForElementToAppear(element: XCUIElement, timeout: NSTimeInterval = 5, file: String = #file, line: UInt = #line , logerror: Bool = true) {
        
        waitForElement(element, timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    func waitForElement( element: XCUIElement, timeout: NSTimeInterval = 5, callback:XCWaitCompletionHandler? = nil) -> Bool{
        let existsPredicate = NSPredicate(format: "exists == true")
        //let hittablePredicate = NSPredicate(format: "hittable == true")
        
        var success:Bool = true
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
            callback?(error)
            success = error == nil
        }
        
        return success
    }
    func sleep( timeout: NSTimeInterval = 5) {
        waitUntilElementExists( XCUIApplication().buttons["!@##@!"], timeout: timeout )
    }
    /** Extending system TC class to provide functionality to block while waiting element to appear
     */
    func waitUntilElementExists(element: XCUIElement, timeout: NSTimeInterval = 5) -> Bool {
        let startTime:NSTimeInterval = NSDate().timeIntervalSinceReferenceDate
        while(!element.exists) {
            if(NSDate().timeIntervalSinceReferenceDate-startTime > timeout ) {
                return false;
            }
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
        }
        return element.exists
    }
}

extension XCUIElement
{
    /**
     Emulates long press
     */
    func bnr_longPress() {
        let duration: NSTimeInterval = 0.6
        pressForDuration(duration)
    }
}
