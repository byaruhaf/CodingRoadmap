//: [Previous](@previous)

//https://leetcode.com/problems/intersection-of-two-arrays-ii/

import XCTest

class Solution {
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var result: [Int] = []
        var map = Dictionary(nums1.map {($0, 1)}, uniquingKeysWith: +)
        
        for n in nums2 where map[n, default: 0] > 0 {
            result.append(n)
            map[n]! -= 1
        }
        return result
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
        let nums1 = [1,2,2,1], nums2 = [2,2]
        let output = [2,2]
        XCTAssert( solution.intersect(nums1, nums2) == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let nums1 = [4,9,5], nums2 = [9,4,9,8,4]
        let output = [4,9]
        XCTAssert( solution.intersect(nums1, nums2) == output || solution.intersect(nums1, nums2) == output.reversed())
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
