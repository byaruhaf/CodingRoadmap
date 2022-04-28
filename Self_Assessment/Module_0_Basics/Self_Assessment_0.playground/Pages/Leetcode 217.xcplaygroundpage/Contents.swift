//: [Previous](@previous)

//https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count != nums.count
    }
}

// Testing
var nums1 = [0,0,1,1,1,2,2,3,3,4]
print(nums1)
print(Solution().containsDuplicate(nums1))

var nums2 = [1,2,3,4]
print(nums2)
print(Solution().containsDuplicate(nums2))

