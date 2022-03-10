//https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums)).sorted()
        return nums.count
    }
}

// Testing
var nums = [0,0,1,1,1,2,2,3,3,4]
print(nums)
print(Solution().removeDuplicates(&nums))
print(nums)

//: [Next](@next)
