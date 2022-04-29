//: [Previous](@previous)
// https://leetcode.com/problems/reverse-string/submissions/

import Foundation
import XCTest

class Solution {
    func reverseString(_ s: inout [Character]) {
        s.reverse()
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
        var input:[Character] = ["h","e","l","l","o"]
        let output:[Character] = ["o","l","l","e","h"]
        solution.reverseString(&input)
        XCTAssert( input == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        var input:[Character] = ["H","a","n","n","a","h"]
        let output:[Character] = ["h","a","n","n","a","H"]
        solution.reverseString(&input)
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
