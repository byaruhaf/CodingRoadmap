//https://stackoverflow.com/questions/47794688/closest-match-string-array-sorting-in-swift
//https://github.com/seanoshea/FuzzyMatchingSwift
//https://github.com/krisk/fuse-swift
//https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Swift
//https://www.geeksforgeeks.org/bk-tree-introduction-implementation/
//https://github.com/topics/spell-checker?o=asc&s=stars
//http://blog.notdot.net/2007/4/Damn-Cool-Algorithms-Part-1-BK-Trees

import Cocoa
import XCTest


extension String {
    func levenshteinDistanceScore(to string: String, ignoreCase: Bool = true, trimWhiteSpacesAndNewLines: Bool = true) -> Float {

        var firstString = self
        var secondString = string

        if ignoreCase {
            firstString = firstString.lowercased()
            secondString = secondString.lowercased()
        }
        if trimWhiteSpacesAndNewLines {
            firstString = firstString.trimmingCharacters(in: .whitespacesAndNewlines)
            secondString = secondString.trimmingCharacters(in: .whitespacesAndNewlines)
        }

        let empty = [Int](repeating:0, count: secondString.count)
        var last = [Int](0...secondString.count)

        for (i, tLett) in firstString.enumerated() {
            var cur = [i + 1] + empty
            for (j, sLett) in secondString.enumerated() {
                cur[j + 1] = tLett == sLett ? last[j] : Swift.min(last[j], last[j + 1], cur[j])+1
            }
            last = cur
        }

        // maximum string length between the two
        let lowestScore = max(firstString.count, secondString.count)

        if let validDistance = last.last {
            return  1 - (Float(validDistance) / Float(lowestScore))
        }

        return 0.0
    }
}


infix operator =~
func =~(string: String, otherString: String) -> Bool {
    return string.levenshteinDistanceScore(to: otherString) >= 0.5
}


class Solution {
var wordArray: [String] = []

public func binarySearch(_ a: [String], key: String) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if key =~ a[midIndex]  {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}


func loadWords() {
    do {
        guard let fileUrl = Bundle.main.url(forResource: "words", withExtension: "txt") else { fatalError() }
        let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        wordArray = text.components(separatedBy: "\n")
        wordArray.sort()
    } catch let error {
        print("Fatal Error: \(error.localizedDescription)")
    }

}

func serach(_ word:String, arr:[String]) -> String{
    guard let index = binarySearch(arr, key: word) else { return ""}
    return arr[index]
}

}


/// Unit Tests for Solution Class.
class ProjectTests: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
        solution.loadWords()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        print("                ")
        print("[Test Example 1]")
        XCTAssert(solution.serach("Zaglossus", arr: solution.wordArray) == "Zaglossus")
        XCTAssert(solution.serach("Zagpossus", arr: solution.wordArray) == "Zaglossus")
    }
    func testExample2() {
        print("                ")
        print("[Test Example 2]")
        let testwordArray = ["apple", "banana", "bingo", "cat", "curl"]
        XCTAssert(solution.serach("bingo", arr: testwordArray) == "bingo")
        XCTAssert(solution.serach("banjo", arr: testwordArray) == "bingo")
        XCTAssert(solution.serach("cut", arr: testwordArray) == "curl")
        XCTAssert(solution.serach("cat", arr: testwordArray) == "cat")

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


