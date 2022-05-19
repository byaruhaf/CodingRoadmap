//: [Previous](@previous)

//https://leetcode.com/problems/missing-number/

import XCTest

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let missingNum = nums.reduce(0, ^)
        return (0...nums.count).reduce(missingNum, ^)
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
        let nums = [3,0,1]
        let output = 2
        XCTAssert( solution.missingNumber(nums) == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let nums = [0,1]
        let output = 2
        XCTAssert( solution.missingNumber(nums) == output)
    }
    
    func testExample3() {
        print("                ")
        print("[Test Example 3]")
        let nums = [9,6,4,2,3,5,7,0,1]
        let output = 8
        XCTAssert( solution.missingNumber(nums) == output)
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
