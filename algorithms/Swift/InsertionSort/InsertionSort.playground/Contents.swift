

extension Array where Element: Comparable {
    mutating func insertionSort() {
        var array = self
        for boundary in 1..<array.count {
            let value = array[boundary]
            
            for i in stride(from: boundary, through: 0, by: -1) where value < array[i] {
                array[i+1] = array[i]
                array[i] = value
            }
        }
        
        self = array
    }
}

var array1 = [4,9,5,6,3,1,7,8,2,14,11,13,12,18,15,19,16,20,17]
var array2 = ["zebra","hello", "apple", "john", "flower", "martin", "mango", "man", "manima"]

array1.insertionSort()
print(array1)
array2.insertionSort()
print(array2)
