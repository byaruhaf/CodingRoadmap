//: [Previous](@previous)

//https://leetcode.com/problems/subdomain-visit-count/

import XCTest

class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var splitArrayTemp: [String] = []
        
        for i in cpdomains {
            
            let splitString1 = i.split(separator: " ")
            let rep = splitString1[0]
            var splitString2 = splitString1[1].split(separator: ".")
            
            if splitString2.count > 2 {
                splitString2.removeFirst()
            }
            
            splitArrayTemp += Array(Set([i, rep + " " + splitString2[0] + "." + splitString2[1], rep + " " + splitString2[1]  ]))
        }
        
        let splitArrayFinal = splitArrayTemp.map() {$0.split(separator: " ")}
        var finalDic = [String: Int]()
        
        for i in splitArrayFinal {
            finalDic[String(i[1]), default: 0] += Int(i[0])!
        }
        
        var result = [String]()
        
        for (key, value) in finalDic {
            result.append("\(value) \(key)")
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
        let cpdomains = ["9001 discuss.leetcode.com"]
        let output = ["9001 leetcode.com","9001 discuss.leetcode.com","9001 com"]
        XCTAssert( solution.subdomainVisits(cpdomains).sorted() == output.sorted())
    }
    
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let cpdomains = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
        let output = ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
        XCTAssert( solution.subdomainVisits(cpdomains).sorted() == output.sorted())
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
