import Cocoa
import Foundation
import XCTest



class Solution {
    let alphabet = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ".flatMap { $0.description }.map {String($0)}

    func apply_shift(_ text: String, _ shift: Int) -> String {
        let unicodeScalars = text.unicodeScalars.map { UnicodeScalar(Int($0.value) + shift)! }
        return String(String.UnicodeScalarView(unicodeScalars))
    }
    
    func build_coder(_ shift:Int) -> [String:String] {
        let shiftedAlphabet = alphabet.map() {apply_shift(String($0),shift)}
        let cipherDictionary: [String:String] = Dictionary(uniqueKeysWithValues: zip(alphabet, shiftedAlphabet))
        return cipherDictionary
    }
    
    func build_encoder(_ shift:Int) -> [String:String] {
        return build_coder(shift)
    }
    
    func build_decoder(_ shift:Int) -> [String:String] {
        return Dictionary(uniqueKeysWithValues: build_coder(shift).map {(key, value) in return (value, key)})
    }
    
    func apply_coder(_ text: String, _ coder: [String:String]) -> String {
        return text.map {coder[String($0)] ?? String($0)}.joined()
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
    
    func XCTAssertEqualDictionaries<S, T: Equatable>(first: [S:T], _ second: [S:T]) {
        XCTAssert(first == second)
    }
    
    func testBuild_Coderr() {
        print("[Test build coder]")
        XCTAssertEqualDictionaries(first: solution.build_coder(3), ["l": "o", "G": "J", "A": "D", "O": "R", "e": "h", "p": "s", "Y": "\\", "w": "z", "j": "m", "J": "M", "y": "|", "H": "K", "T": "W", "L": "O", "g": "j", "h": "k", "o": "r", "M": "P", "r": "u", "t": "w", "n": "q", "B": "E", "S": "V", "i": "l", "Q": "T", "b": "e", "k": "n", "f": "i", "v": "y", "W": "Z", "c": "f", "I": "L", "N": "Q", "F": "I", "Z": "]", "R": "U", "a": "d", "z": "}", "s": "v", "x": "{", "E": "H", "D": "G", "X": "[", "P": "S", "d": "g", "u": "x", " ": "#", "U": "X", "C": "F", "q": "t", "K": "N", "m": "p", "V": "Y"])
    }
    func testBuild_Encoder() {
        print("[Test build encoder]")
        XCTAssertEqualDictionaries(first: solution.build_encoder(3), ["l": "o", "G": "J", "A": "D", "O": "R", "e": "h", "p": "s", "Y": "\\", "w": "z", "j": "m", "J": "M", "y": "|", "H": "K", "T": "W", "L": "O", "g": "j", "h": "k", "o": "r", "M": "P", "r": "u", "t": "w", "n": "q", "B": "E", "S": "V", "i": "l", "Q": "T", "b": "e", "k": "n", "f": "i", "v": "y", "W": "Z", "c": "f", "I": "L", "N": "Q", "F": "I", "Z": "]", "R": "U", "a": "d", "z": "}", "s": "v", "x": "{", "E": "H", "D": "G", "X": "[", "P": "S", "d": "g", "u": "x", " ": "#", "U": "X", "C": "F", "q": "t", "K": "N", "m": "p", "V": "Y"])
    }
    
    func testBuild_Decoder() {
        print("[Test build decoder]")
        XCTAssertEqualDictionaries(first: solution.build_decoder(3), ["K": "H", "i": "f", "o": "l", "G": "D", "P": "M", "f": "c", "H": "E", "O": "L", "m": "j", "z": "w", "T": "Q", "J": "G", "g": "d", "[": "X", "{": "x", "M": "J", "V": "S", "Q": "N", "I": "F", "E": "B", "X": "U", "}": "z", "|": "y", "S": "P", "U": "R", "x": "u", "u": "r", "j": "g", "Y": "V", "R": "O", "F": "C", "D": "A", "N": "K", "y": "v", "n": "k", "l": "i", "Z": "W", "v": "s", "]": "Z", "q": "n", "#": " ", "\\": "Y", "s": "p", "r": "o", "w": "t", "W": "T", "p": "m", "d": "a", "L": "I", "h": "e", "t": "q", "e": "b", "k": "h"])
    }
    
    func testApplyCoder() {
        print("[Test apply coder]")
        XCTAssert(solution.apply_coder("Hello, world!", solution.build_encoder(3)) == "Khoor,#zruog!")
        XCTAssert(solution.apply_coder("Khoor,#zruog!", solution.build_decoder(3)) == "Hello, world!")
    }
    
    func testApplyShift() {
        print("[Test apply shift]")
        XCTAssert(solution.apply_shift("Utsav", 8) == "]|{i~")
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
 

