import Cocoa
import XCTest

class BrowserHistory {
    var currentCount: Int = 0
    var history = LinkedList<String>() //LinkedList struct in the sources folder.
    init(_ startpage: String) {
        history.push(startpage)
    }

    //Visits url from the current page. It clears up all the forward history
    func visit(_ url:String) {
        for _ in 0..<currentCount {
            history.pop()
        }
        currentCount = 0
        history.push(url)
    }

    //Move steps back in history
    func back(_ steps: Int) -> String {
        currentCount += steps
        if currentCount > history.count {
            currentCount = history.count - 1
        }
        return history.node(at: currentCount)!.value
    }

    //Move steps forward in history.
    func forward(_ steps: Int) -> String {
        currentCount -= steps
        if currentCount <= 0 {
            currentCount = 0
        }
        return history.node(at: currentCount)!.value
    }
}


/// Unit Tests for Solution Class.
class SolutionTests: XCTestCase {
    var browserHistory: BrowserHistory!

    override func setUp() {
        super.setUp()
        browserHistory = BrowserHistory("leetcode.com")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        print("                ")
        print("[Test Example 1]")
        var output: [String] = []
        browserHistory.visit("google.com")         // You are in "leetcode.com". Visit "google.com"
        browserHistory.visit("facebook.com")       // You are in "google.com". Visit "facebook.com"
        browserHistory.visit("youtube.com")        // You are in "facebook.com". Visit "youtube.com"
        output.append(browserHistory.back(1))      // You are in "youtube.com", move back to "facebook.com" return "facebook.com"
        output.append(browserHistory.back(1))      // You are in "facebook.com", move back to "google.com" return "google.com"
        output.append(browserHistory.forward(1))   // You are in "google.com", move forward to "facebook.com" return "facebook.com"
        browserHistory.visit("linkedin.com")       // You are in "facebook.com". Visit "linkedin.com"
        output.append(browserHistory.forward(2))   // You are in "linkedin.com", you cannot move forward any steps.
        output.append(browserHistory.back(2))      // You are in "linkedin.com", move back two steps to "facebook.com" then to "google.com". return "google.com"
        output.append(browserHistory.back(7))      // You are in "google.com", you can move back only one step to "leetcode.com". return "leetcode.com"
        output.append(browserHistory.forward(7))   // You are in "google.com", you can move back only one step to "leetcode.com". return "leetcode.com"
        XCTAssert( output == ["facebook.com","google.com","facebook.com","linkedin.com","google.com","leetcode.com","linkedin.com"])
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


