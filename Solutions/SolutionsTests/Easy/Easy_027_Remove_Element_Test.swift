//
//  Easy_027_Remove_Element_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/7/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_027_Remove_Element_Test: XCTestCase {
    private static let ProblemName: String = "Easy_027_Remove_Element"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Any] = [[1, 2, 2, 3], 2]
        var expected: [Int] = [1, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Any] = [[1, 2, 3], 4]
        var expected: [Int] = [1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Any] = [[], 4]
        var expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Any] = [[1, 2, 2, 3, 6, 7, 6, 8, 1, 3, 2, 6], 6]
        var expected: [Int] = [1, 2, 2, 3, 7, 8, 1, 3, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Any] = [[1], 1]
        var expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Any], expected: [Int]) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_027_Remove_Element_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var arr: [Int] = input[0] as! [Int]
            var elem: Int = input[1] as! Int
            var result: Int = Easy_027_Remove_Element.removeElement(arr: &arr, elem: elem)
            assertHelper(expected == Array(arr[0..<result]), problemName: Easy_027_Remove_Element_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_027_Remove_Element_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_027_Remove_Element_Test.ProblemName, input: input, resultValue: Easy_027_Remove_Element_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
