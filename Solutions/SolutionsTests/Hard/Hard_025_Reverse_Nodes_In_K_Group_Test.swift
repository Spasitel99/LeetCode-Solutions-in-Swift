//
//  Hard_025_Reverse_Nodes_In_K_Group_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_025_Reverse_Nodes_In_K_Group_Test: XCTestCase {
    private static let ProblemName: String = "Hard_025_Reverse_Nodes_In_K_Group"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Hard_025_Reverse_Nodes_In_K_Group.Node
    func test_001() {
        var input: [Any] = [helper1([1, 2, 3, 4]), 2]
        var expected: [Int] = [2, 1, 4, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Any] = [helper1([1, 2, 3, 4]), 1]
        var expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Any] = [helper1([1, 2, 3, 4]), 3]
        var expected: [Int] = [3, 2, 1, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Any] = [helper1([]), 3]
        var expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Any] = [helper1([1, 2, 3, 4]), 999]
        var expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    private func helper1(intArray: [Int]) -> Node? {
        var nodeArray: [Node] = []
        for i in intArray {
            var node: Node = Node(value: i, next: nil)
            nodeArray.append(node)
        }
        if nodeArray.count == 0 {
            return nil
        }
        for i in 0..<nodeArray.count-1 {
            nodeArray[i].next = nodeArray[i+1]
        }
        return nodeArray[0]
    }
    private func helper2(head: Node?) -> [Int] {
        var res: [Int] = []
        var localHead = head
        while localHead != nil {
            res.append(localHead!.value)
            localHead = localHead?.next
        }
        return res
    }
    private func asyncHelper(# input: [Any], expected: [Int]) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var unwrapped: Node? = unwrap(input[0]) as? Node
            var result: [Int] = self.helper2(Hard_025_Reverse_Nodes_In_K_Group.reverseKGroup(head: unwrapped, k: input[1] as! Int))
            assertHelper(expected == result, problemName: Hard_025_Reverse_Nodes_In_K_Group_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_025_Reverse_Nodes_In_K_Group_Test.ProblemName, input: input, resultValue: Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
