//: [Previous](@previous)
import Foundation
import XCTest

class Solution {
    func reorderSpaces(_ text: String) -> String {
        let wordArray = text.split(separator: " ")
        let whitespacesCount = text.filter { $0 == " " }.count
        if wordArray.count == 1 && whitespacesCount == 0{
            return text
        }
        
        let gaps = wordArray.count - 1
        let left_over = gaps == 0 ? whitespacesCount : whitespacesCount % gaps
        let equal_spaces = gaps == 0 ? 0 : (whitespacesCount - left_over) / gaps


        let gapString = String(repeating: " ", count: equal_spaces)
        var left_overString = ""
        if left_over !=  0 {
            left_overString = String(repeating: " ", count: left_over)
        }

        return "\(wordArray.joined(separator: gapString))\(left_overString)"
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
        let input = "  this   is  a sentence "
        XCTAssert(solution.reorderSpaces(input) == "this   is   a   sentence")
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let input = " practice   makes   perfect"
        XCTAssert(solution.reorderSpaces(input) == "practice   makes   perfect ")
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

