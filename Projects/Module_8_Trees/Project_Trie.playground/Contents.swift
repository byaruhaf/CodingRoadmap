import XCTest

class TrieNode {
    var terminal = false
    var suffixes = [Character: TrieNode]()

    func find(_ cs: [Character]) -> TrieNode? {
        var node: TrieNode? = self
        for c in cs where node != nil{
            node = node?.suffixes[c]
        }
        return node
    }

    func insert(_ cs: [Character]) {
        var node: TrieNode = self
        for c in cs {
            node.suffixes[c] = node.suffixes[c, default: TrieNode()]
            node = node.suffixes[c]!
        }
        node.terminal = true
    }
}

class Trie {

    let root = TrieNode()

    func insert(_ word: String) { root.insert(Array(word)) }

    func startsWith(_ prefix: String) -> Bool { root.find(Array(prefix)) != nil }

    func search(_ word: String) -> Bool {
        guard let node = root.find(Array(word)) else { return false }
        return node.terminal
    }



}


/// Unit Tests for Solution Class.
class ProjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        print("                ")
        print("[Test Example 1]")
        let trie = Trie()
        trie.insert("apple")
        XCTAssertEqual(trie.search("apple"), true)
        XCTAssertEqual(trie.search("app"), false)
        XCTAssertEqual(trie.startsWith("app"),true)
        trie.insert("app")
        XCTAssertEqual(trie.search("app"), true)
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
ProjectTests.defaultTestSuite.run()


