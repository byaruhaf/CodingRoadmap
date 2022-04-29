//: [Previous](@previous)

import Foundation
import XCTest


class Solution {
    func reverseOnlyLetters(_ s: String) -> String {
        let sArray = Array(s)
        var reversedsArray = sArray
        let letterArray = sArray.filter({ $0.isLetter })
        
        var reversedletterArray = letterArray

        for (index, item) in sArray.enumerated() {
            
            if item.isLetter  {
                reversedsArray[index] = reversedletterArray.removeLast()
            }
        }
        return String(reversedsArray)

    }
}


//["T", "e", "s", "t", "1", "n", "g", "-", "L", "e", "e", "t", "=", "c", "o", "d", "e", "-", "Q", "!"]
//["Q", "e", "d", "o",      "c", "t",      "e", "e", "L", "g",      "n", "t", "s", "e",      "T"     ]
//  Q    e    d    o    1    c    t    -    e    e    L    g    =    n    t    s    e    -    T    !

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
        XCTAssert(solution.reverseOnlyLetters("ab-cd") == "dc-ba")
    }

    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert(solution.reverseOnlyLetters("a-bC-dEf-ghIj") == "j-Ih-gfE-dCba")
    }
    
    func testExample3() {
        print("                ")
        print("[Test Example 3]")
        XCTAssert(solution.reverseOnlyLetters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!")
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
