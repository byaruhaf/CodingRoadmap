//: [Previous](@previous)

//https://leetcode.com/problems/intersection-of-two-linked-lists/submissions/

import XCTest


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil, headB != nil else { return nil }

        var nodea: ListNode? = headA
        var nodeb: ListNode? = headB

        while nodea !== nodeb {
            nodea = nodea == nil ? headB : nodea?.next
            nodeb = nodeb == nil ? headA : nodeb?.next
        }
        return nodea
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

            let listA1 = ListNode(4)
            let listA2 = ListNode(1)
            let listA3 = ListNode(8)
            let listA4 = ListNode(4)
            let listA5 = ListNode(5)
            listA1.next = listA2
            listA2.next = listA3
            listA3.next = listA4
            listA4.next = listA5

            let listB1 = ListNode(5)
            let listB2 = ListNode(6)
            let listB3 = ListNode(1)
            let listB4 = ListNode(8)
            let listB5 = ListNode(4)
            let listB6 = ListNode(5)
            listB1.next = listB2
            listB2.next = listB3
            listB3.next = listB4
            listB4.next = listB5
            listB5.next = listB6

            let output = Solution().getIntersectionNode(listA1, listB1)
            XCTAssert( output?.val == 8)
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
