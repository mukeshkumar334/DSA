
extension Array where Element: Comparable {
    ///Best: Ω(n^2),   Worst: O(n^2),  Average: θ(n^2)
     mutating func selectionSort() {
        var array = self
        for i in 0...array.count - 2 {
            var minmIndex = i
            
            for j in i+1..<array.count {
                minmIndex = array[minmIndex] < array[j] ? minmIndex : j
            }
            
            let tempElement = array[i]
            array[i] = array[minmIndex]
            array[minmIndex] = tempElement
        }

        self = array
    }
}

var array1 = [4,9,5,6,3,1,7,8,2,14,11,13,12,18,15,19,16,20,17]
var array2 = ["zebra","hello", "apple", "john", "flower", "martin", "mango", "man", "manima"]
array1.selectionSort()
//array2.selectionSort()
print(array1)
//print(array2)
