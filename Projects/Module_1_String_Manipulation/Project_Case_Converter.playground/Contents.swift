import Cocoa
import Foundation
import XCTest

extension String {
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {okayChars.contains($0) }
    }
}

class Solution {
    enum SentenceCase: String {
        case camel, snake, kebab, pascal, uppercasesnake;
    }
    
    func convert(_ sentence:String, _ newCase:String) -> String {
        switch newCase {
        case SentenceCase.camel.rawValue:
            return camelConvert(sentence)
        case SentenceCase.snake.rawValue:
            return snakeConvert(sentence)
        case SentenceCase.kebab.rawValue:
            return kebabConvert(sentence)
        case SentenceCase.pascal.rawValue:
            return pascalConvert(sentence)
        case SentenceCase.uppercasesnake.rawValue:
            return uppercasesnakeConvert(sentence)
        default:
            return sentence
        }
    }
    
    /// Convert String to camel case
    /// - Parameter s: Input string to be converted
    /// - Returns: Converted String in camel case
    func camelConvert(_ s:String) -> String {
        var sArray = s.stripped.components(separatedBy: .whitespaces)
        for (index, item) in sArray.enumerated() {
            if index == 0 {
                sArray[index] = item.lowercased()
                continue
            }
            sArray[index] = item.lowercased().capitalized
        }
        return sArray.joined(separator: "")
    }
    /// Convert String to snake case
    /// - Parameter s: Input string to be converted
    /// - Returns: Converted String in snake case
    func snakeConvert(_ s:String) -> String {
        var sArray = s.stripped.components(separatedBy: .whitespaces)
        for (index, item) in sArray.enumerated() {
            sArray[index] = item.lowercased()
        }
        return sArray.joined(separator: "_")
    }
    ///  Convert String to kebab case
    /// - Parameter s: Input string to be converted
    /// - Returns:  Converted String in kebab case
    func kebabConvert(_ s:String) -> String {
        var sArray = s.stripped.components(separatedBy: .whitespaces)
        for (index, item) in sArray.enumerated() {
            sArray[index] = item.lowercased()
        }
        return sArray.joined(separator: "-")
    }
    ///  Convert String to pascal case
    /// - Parameter s: Input string to be converted
    /// - Returns:  Converted String in pascal case
    func pascalConvert(_ s:String) -> String {
        var sArray = s.stripped.components(separatedBy: .whitespaces)
        for (index, item) in sArray.enumerated() {
            sArray[index] = item.lowercased().capitalized
        }
        return sArray.joined(separator: "")
    }
    
    /// Convert String to  uppercase snake case
    /// - Parameter s: Input string to be converted
    /// - Returns:  Converted String in uppercase snake case
    func uppercasesnakeConvert(_ s:String) -> String {
        var sArray = s.stripped.components(separatedBy: .whitespaces)
        for (index, item) in sArray.enumerated() {
            sArray[index] = item.uppercased()
        }
        return sArray.joined(separator: "_")
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
    
    func testCamelConverter() {
        print("                ")
        print("[Test Camel Converter]")
        XCTAssert(solution.convert("Hello, World.", "camel") == "helloWorld")
    }
    func testSnakeConverter() {
        print("                ")
        print("[Test snake Converter]")
        XCTAssert(solution.convert("Hello, World.", "snake") == "hello_world")
    }
    func testKebabConverter() {
        print("                ")
        print("[Test kebab Converter]")
        XCTAssert(solution.convert("Hello, World.", "kebab") == "hello-world")
    }
    func testPascalConverter() {
        print("                ")
        print("[Test pascal Converter]")
        XCTAssert(solution.convert("Hello, World.", "pascal") == "HelloWorld")
    }
    func testuppercaseSnakeConverter() {
        print("                ")
        print("[Test uppercase snake Converter]")
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
