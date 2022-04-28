// https://leetcode.com/problems/valid-palindrome/

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        let s1 = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
        return check(s1)
    
    }
    
        func check(_ str:String) -> Bool {
    
        let reversedstr = String(str.reversed())
        
        if str == reversedstr {
            return true
        }
            return false
        }
}
let solution = Solution()
//Example 1:
//Input: s = "A man, a plan, a canal: Panama"
//Output: true
//Explanation: "amanaplanacanalpanama" is a palindrome.

var input = "A man, a plan, a canal: Panama"
var output = solution.isPalindrome(input)
print(output)

//Example 2:
//Input: s = "race a car"
//Output: false
//Explanation: "raceacar" is not a palindrome.

input = "race a car"
output = solution.isPalindrome(input)
print(output)

//Example 3:
//Input: s = " "
//Output: true
//Explanation: s is an empty string "" after removing non-alphanumeric characters.
//Since an empty string reads the same forward and backward, it is a palindrome.

input =  " "
output = solution.isPalindrome(input)
print(output)


//: [Next](@next)
