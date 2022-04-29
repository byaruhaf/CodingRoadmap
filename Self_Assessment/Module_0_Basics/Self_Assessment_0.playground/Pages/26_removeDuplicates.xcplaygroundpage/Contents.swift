//https://leetcode.com/problems/remove-duplicates-from-sorted-array/
import XCTest

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums)).sorted()
        return nums.count
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
        var input = [1,1,2]
        let output = [1,2]
        solution.removeDuplicates(&input)
        XCTAssert( input == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        var input = [0,0,1,1,1,2,2,3,3,4]
        let output = [0,1,2,3,4]
        solution.removeDuplicates(&input)
        XCTAssert(input == output)
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
