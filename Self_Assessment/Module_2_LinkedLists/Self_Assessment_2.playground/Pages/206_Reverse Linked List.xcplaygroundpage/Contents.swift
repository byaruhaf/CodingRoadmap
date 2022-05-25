//: [Previous](@previous)

//https://leetcode.com/problems/reverse-linked-list/

import XCTest


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val)->" + String(describing: next)
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var tempNode:ListNode? = nil
        var prevNode:ListNode? = nil
        while head != nil {
            tempNode = head?.next
            head?.next = prevNode
            prevNode = head
            head = tempNode
        }
        return prevNode
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
        Solution().reverseList(node1)
        let output = String(describing: node4)
        XCTAssert( output == "9->1->5->4")
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


//: [Next](@next)
