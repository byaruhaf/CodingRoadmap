//: [Previous](@previous)

//https://leetcode.com/problems/pascals-triangle/

import XCTest

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result:[[Int]]  = [[1]]
        
        if numRows == 1{
            return result
        }
        
        for _ in 0...(numRows - 2) {
            let lastRow = result[result.count - 1]
            let calRow = [0]+lastRow+[0]
            var newRow:[Int] = []
            for j in 0...(lastRow.count) {
                let newinput = calRow[j] + calRow[j+1]
                newRow.append(newinput)
            }
            result.append(newRow)
        }

        print(result)
        
        return  result
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
        XCTAssert( Solution().generate(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert( Solution().generate(1) ==  [[1]])
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
