//: [Previous](@previous)
// https://leetcode.com/problems/reverse-string/submissions/

class Solution {
    func reverseString(_ s: inout [Character]) {
        s.reverse()
    }
}

let solution = Solution()
//Example 1:
//Input: s = ["h","e","l","l","o"]
//Output: ["o","l","l","e","h"]

var input:[Character] = ["h","e","l","l","o"]
solution.reverseString(&input)
print(input)


//Example 2:
//Input: s = ["H","a","n","n","a","h"]
//Output: ["h","a","n","n","a","H"]

input = ["H","a","n","n","a","h"]
solution.reverseString(&input)
print(input)

 
//: [Next](@next)
