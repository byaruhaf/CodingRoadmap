import Cocoa
import XCTest

class Arithmetic {

    func calculate(expression:String) -> Int {
        let sExpression = expression.filter {!$0.isWhitespace}
        var numStack = Stack<Int>()
        var opStack = Stack<Character>()
        for i in sExpression {
            if let intValue = i.wholeNumberValue {
                numStack.push(intValue)
            } else {
                opStack.push(i)
            }
        }

        while !opStack.isEmpty {
            let num1 = numStack.pop()!
            let num2 = numStack.pop()!
            let currentSign = opStack.pop()!
            let result = ops(currentSign, num1, num2)
            numStack.push(result)
        }
        return numStack.pop()!
    }

    func ops(_ sign:Character,_ num1:Int,_ num2:Int) -> Int {
        if sign == "/" {
            return num2 / num1
        }else if sign == "*" {
            return num1 * num2
        }else if sign == "+" {
            return num1 + num2
        }else {
            return num1 - num2
        }
    }

}


/// Unit Tests for Solution Class.
class SolutionTests: XCTestCase {
    var calc: Arithmetic!

    override func setUp() {
        super.setUp()
        calc = Arithmetic()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        print("                ")
        print("[Test Example 1]")
        XCTAssert( calc.calculate(expression: "3+2*2") == 7 )
    }
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        XCTAssert( calc.calculate(expression: " 3/2 ") == 1 )
    }
    func testExample3() {
        print("                ")
        print("[Test Example 3]")
        XCTAssert( calc.calculate(expression: " 3+5 / 2 ") == 5 )
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


