//https://leetcode.com/problems/delete-node-in-a-linked-list/

import XCTest


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



class Solution {
    func deleteNode(_ node: ListNode?) {
        let currentNode = node
        currentNode!.val = currentNode!.next!.val
        currentNode!.next = currentNode!.next!.next
    }
}


/// Unit Tests for Solution Class.
class SolutionTests: XCTestCase {
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample1() {
        print("                ")
        print("[Test Example 1]")
        let node1 = ListNode(4)
        let node2 = ListNode(5)
        let node3 = ListNode(1)
        let node4 = ListNode(9)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        Solution().deleteNode(node2)
        XCTAssert( node1.val + node1.next!.val + node1.next!.next!.val == 14)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let node1 = ListNode(4)
        let node2 = ListNode(5)
        let node3 = ListNode(1)
        let node4 = ListNode(9)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        Solution().deleteNode(node3)
        XCTAssert( node1.val + node1.next!.val + node1.next!.next!.val == 18)
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        print("                                                                   ")
        print("*******************************************************************")
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
        print("*******************************************************************")
        print("                                                                   ")
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
SolutionTests.defaultTestSuite.run()

