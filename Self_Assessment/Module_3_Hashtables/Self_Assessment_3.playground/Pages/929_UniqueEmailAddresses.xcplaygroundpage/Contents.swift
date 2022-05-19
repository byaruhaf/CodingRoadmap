
//https://leetcode.com/problems/unique-email-addresses/

import Foundation
import XCTest

class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var valuedSet = Set<String>()
        
        for email in emails {
            let splitString = email.split(separator: "@")
            
            let uniqueEmail = splitString[0].split(separator: "+")[0].replacingOccurrences(of: ".", with: "") + "@" + splitString[1]
            
            valuedSet.insert(uniqueEmail)
            
        }
        
        return valuedSet.count
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
        let emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        let output = 2
        XCTAssert( solution.numUniqueEmails(emails) == output)
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
        let output = 3
        XCTAssert( solution.numUniqueEmails(emails) == output)
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

