/*
 Container With Most Water
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

Notice that you may not slant the container.
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var start = 0, end = height.count - 1
        var maxArea = 0
        
        while start < end {
            maxArea = max(maxArea, (end - start) * min(height[start], height[end]))
            if height[end] <= height[start] {
                end -= 1    
            } else {
                start += 1
            }
        }
        return maxArea
    }
}
