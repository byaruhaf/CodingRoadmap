// https://leetcode.com/problems/valid-palindrome/

import Foundation
import XCTest

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s1 = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
        return check(s1)
    }
    
    func check(_ str:String) -> Bool {
        let reversedstr = String(str.reversed())
        if str == reversedstr { return true }
        return false
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
        //Input: s = "A man, a plan, a canal: Panama"
        //Output: true
        //Explanation: "amanaplanacanalpanama" is a palindrome.
        print("                ")
        print("[Test Example 1]")
        let input = "A man, a plan, a canal: Panama"
        XCTAssert(solution.isPalindrome(input) == true)
    }
    
    func testExample2() {
        //Input: s = "race a car"
        //Output: false
        //Explanation: "raceacar" is not a palindrome.
        print("                ")
        print("[Test Example 2]")
        let input = "race a car"
        XCTAssert(solution.isPalindrome(input) == false)
    }
    
    func testExample3() {
        //Input: s = " "
        //Output: true
        //Explanation: s is an empty string "" after removing non-alphanumeric characters.
        //Since an empty string reads the same forward and backward, it is a palindrome.
        print("                ")
        print("[Test Example 3]")
        let input =  " "
        XCTAssert(solution.isPalindrome(input) == true)
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
