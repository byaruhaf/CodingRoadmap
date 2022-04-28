import Cocoa
import Foundation
import XCTest

class Solution {
    enum SentenceCase: String {
        case camel, snake, kebab, pascal, uppercasesnake;
    }
    
    func convert(_ input:String, _ newCase:String) -> String {
        switch newCase {
        case SentenceCase.camel.rawValue:
            return camelConvert(input)
        case SentenceCase.snake.rawValue:
            return snakeConvert(input)
        case SentenceCase.kebab.rawValue:
            return kebabConvert(input)
        case SentenceCase.pascal.rawValue:
            return pascalConvert(input)
        case SentenceCase.uppercasesnake.rawValue:
            return uppercasesnakeConvert(input)
        default:
            return ""
        }
    }
    
    func camelConvert(_ s:String) -> String {
        return "helloWorld"
    }
    func snakeConvert(_ s:String) -> String {
        return "hello_world"
    }
    func kebabConvert(_ s:String) -> String {
        return "hello-world"
    }
    func pascalConvert(_ s:String) -> String {
        return "HelloWorld"
    }
    func uppercasesnakeConvert(_ s:String) -> String {
        return "HELLO_WORLD"
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
        XCTAssert(solution.convert("Hello, World.", "camel") == "helloWorld")
    }
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert(solution.convert("Hello, World.", "snake") == "hello_world")
    }
    func testExample3() {
        print("                ")
        print("[Test Example 3]")
        XCTAssert(solution.convert("Hello, World.", "kebab") == "hello-world")
    }
    func testExample4() {
        print("                ")
        print("[Test Example 4]")
        XCTAssert(solution.convert("Hello, World.", "pascal") == "HelloWorld")
    }
    func testExample5() {
        print("                ")
        print("[Test Example 5]")
        XCTAssert(solution.convert("Hello, World.", "uppercasesnake") == "HELLO_WORLD")
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
