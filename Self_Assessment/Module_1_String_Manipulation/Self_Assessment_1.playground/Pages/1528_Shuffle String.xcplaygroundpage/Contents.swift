//: [Previous](@previous)

import Foundation
import XCTest


class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        let sArray = s.map { String($0) }
        var sRestorArray: [String] = sArray
        
        for (index, item) in sArray.enumerated() {
            sRestorArray[indices[index]] = item
        }
        return sRestorArray.joined()
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
        XCTAssert(solution.restoreString("codeleet", [4,5,6,7,0,2,1,3]) == "leetcode")
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert(solution.restoreString("abc", [0,1,2]) == "abc")
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
