//: [Previous](@previous)

//https://leetcode.com/problems/contains-duplicate/

import XCTest

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count != nums.count
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
        XCTAssert( Solution().containsDuplicate([0,0,1,1,1,2,2,3,3,4]) == true)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert( Solution().containsDuplicate([1,2,3,4]) == false)
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
