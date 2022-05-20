//: [Previous](@previous)

import Cocoa
import Foundation
import XCTest



class Solution {
    let alphabet = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ".flatMap { $0.description }.map {String($0)}

    func apply_shift(_ character: Character, _ shift: Int) -> Character {
        let letterData = "abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz".flatMap { $0.description }
        let currentIndex = letterData.firstIndex(of: Character(character.lowercased()))
        let newIndex = Int(currentIndex!) + shift
        if character.isUppercase {
        return Character(letterData[newIndex].uppercased())
        } else {
        return letterData[newIndex]
        }
    }

    func build_coder(_ shift:Int) -> [String:String] {
        let shiftedAlphabet = alphabet.map() {apply_shift(Character($0),3)}.map {String($0)}
        let cipherDictionary = Dictionary(uniqueKeysWithValues: zip(alphabet, shiftedAlphabet))
        return cipherDictionary
    }

    func build_encoder(_ shift:Int) -> [String:String] {
        return build_coder(shift)
    }

    func build_decoder(_ shift:Int) -> [String:String] {
    //Fix for space problem in roadmap example:
    var correctedCipherDictionary = build_coder(shift)
    let filtered = correctedCipherDictionary.filter { $0.value == " " }
    for (k,_) in filtered {
        if Character(k).isUppercase {
            correctedCipherDictionary.removeValue(forKey: k)
        }
    }
    let revercecipherDictionary = Dictionary(uniqueKeysWithValues: correctedCipherDictionary.map {(key, value) in return (value, key)})

    return revercecipherDictionary
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
        XCTAssertEqualDictionaries(first: solution.build_coder(3), ["h": "k", "p": "s", "b": "e", "X": " ", "J": "M", "d": "g", "U": "X", "a": "d", "t": "w", "Q": "T", "Y": "A", "x": " ", "F": "I", "c": "f", "j": "m", "D": "G", "S": "V", "g": "j", "s": "v", "e": "h", "z": "b", "M": "P", "O": "R", "y": "a", "A": "D", "G": "J", "r": "u", "m": "p", "L": "O", "P": "S", "I": "L", "K": "N", "v": "y", "o": "r", "Z": "B", "C": "F", "H": "K", "B": "E", "R": "U", "T": "W", " ": "c", "i": "l", "n": "q", "k": "n", "f": "i", "q": "t", "W": "Z", "u": "x", "w": "z", "N": "Q", "V": "Y", "E": "H", "l": "o"])
    }
    func testBuild_Encoder() {
        print("[Test build encoder]")
        XCTAssertEqualDictionaries(first: solution.build_encoder(3), ["h": "k", "p": "s", "b": "e", "X": " ", "J": "M", "d": "g", "U": "X", "a": "d", "t": "w", "Q": "T", "Y": "A", "x": " ", "F": "I", "c": "f", "j": "m", "D": "G", "S": "V", "g": "j", "s": "v", "e": "h", "z": "b", "M": "P", "O": "R", "y": "a", "A": "D", "G": "J", "r": "u", "m": "p", "L": "O", "P": "S", "I": "L", "K": "N", "v": "y", "o": "r", "Z": "B", "C": "F", "H": "K", "B": "E", "R": "U", "T": "W", " ": "c", "i": "l", "n": "q", "k": "n", "f": "i", "q": "t", "W": "Z", "u": "x", "w": "z", "N": "Q", "V": "Y", "E": "H", "l": "o"])
    }
    
    func testBuild_Decoder() {
        print("[Test build decoder]")
        XCTAssertEqualDictionaries(first: solution.build_decoder(3), ["K": "H", " ": "x", "c": " ", "w": "t", "V": "S", "M": "J", "k": "h", "a": "y", "R": "O", "Q": "N", "T": "Q", "G": "D", "W": "T", "U": "R", "j": "g", "S": "P", "z": "w", "p": "m", "g": "d", "i": "f", "b": "z", "s": "p", "F": "C", "P": "M", "e": "b", "L": "I", "u": "r", "d": "a", "n": "k", "f": "c", "E": "B", "B": "Z", "I": "F", "h": "e", "q": "n", "H": "E", "v": "s", "m": "j", "x": "u", "D": "A", "J": "G", "t": "q", "N": "K", "l": "i", "y": "v", "o": "l", "Y": "V", "A": "Y", "Z": "W", "r": "o", "X": "U", "O": "L"])
    }
    
    func testApplyCoder() {
        print("[Test apply coder]")
        XCTAssert(solution.apply_coder("Hello, world!", solution.build_encoder(3)) == "Khoor,czruog!")
        XCTAssert(solution.apply_coder("Khoor,czruog!", solution.build_decoder(3)) == "Hello, world!")
    }
    
    func testApplyShift() {
        print("[Test apply shift]")
        XCTAssert(solution.apply_shift("U", 8) == "B")
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
