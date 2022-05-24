//https://stackoverflow.com/questions/47794688/closest-match-string-array-sorting-in-swift
//https://github.com/seanoshea/FuzzyMatchingSwift
//https://github.com/krisk/fuse-swift
//https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Swift
//https://www.geeksforgeeks.org/bk-tree-introduction-implementation/
//https://github.com/topics/spell-checker?o=asc&s=stars
//http://blog.notdot.net/2007/4/Damn-Cool-Algorithms-Part-1-BK-Trees

import Cocoa
var wordArray: [String] = []

public func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    var lastmidIndex:Int = 0
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        lastmidIndex = midIndex
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    print(a[lowerBound...upperBound])
    return lastmidIndex
}


do {
    guard let fileUrl = Bundle.main.url(forResource: "words", withExtension: "txt") else { fatalError() }
    let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
    wordArray = text.components(separatedBy: "\n")
} catch let error {
    print("Fatal Error: \(error.localizedDescription)")
}

// print(wordArray)

func serach(_ word:String, arr:[String]) -> String{
    let filteredArr = arr.filter { $0.count > word.count }
    guard let index = binarySearch(filteredArr,key: word) else { return ""}
    print(wordArray[index])
    return wordArray[index]
}

serach("hupaticology", arr: wordArray)

//
//Given the word list: [apple, banana, bingo, cat, curl]
//Input: bingo
//Output: bingo
//
//Input: banjo
//Output: bingo
//
//Input: cut
//Output: curl
//
//Input: cat
//Output: cat


//func serach(_ word:String) -> String{
//    let testwordArray = ["apple", "banana", "bingo", "cat", "curl"]
//    guard let index = binarySearch(testwordArray,key: word) else { return ""}
//    print(testwordArray[index])
//    return testwordArray[index]
//}
//
//serach("bingo")
//serach("banjo")
//serach("cut")
//serach("cat")
