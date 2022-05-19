//: [Previous](@previous)

//https://leetcode.com/problems/two-sum/

import XCTest

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        return []
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
        let nums = [2,7,11,15], target = 9
        let output = [0,1]
        XCTAssert( solution.twoSum(nums, target) == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let nums = [3,2,4], target = 6
        let output = [1,2]
        XCTAssert( solution.twoSum(nums, target) == output)
    }
    
    func testExample3() {
        print("                ")
        print("[Test Example 3]")
        let nums = [3,3], target = 6
        let output = [0,1]
        XCTAssert( solution.twoSum(nums, target) == output)
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
