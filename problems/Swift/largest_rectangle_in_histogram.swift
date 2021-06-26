/*
Given an array of integers heights representing the histogram's 
bar height where the width of each bar is 1, return the area of 
the largest rectangle in the histogram.
*/


//TC: O(N^2)
//SC: O(1)
func largestRectangleArea(arr: [Int]) -> Int {
    var area = arr[0]
    
    for i in 0..<arr.count {
        var lBorder = i-1, rBorder = i+1
        while lBorder >= 0 && arr[lBorder] >= arr[i] {
            lBorder -= 1
        }
        while rBorder < arr.count && arr[rBorder] >= arr[i]{
            rBorder += 1
        }
        
        area = max(area, arr[i] * (rBorder-lBorder-1))
    }
    return area
}

