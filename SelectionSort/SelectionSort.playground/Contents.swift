
var str = "Hello, playground"

struct SelectionSort {
    static func sort(array: inout [Int]) -> [Int]{
        for i in 0...array.count - 2 {
            var minmIndex = i
            
            for j in i+1..<array.count {
                minmIndex = array[minmIndex] < array[j] ? minmIndex : j
            }
            
            let tempElement = array[i]
            array[i] = array[minmIndex]
            array[minmIndex] = tempElement
        }

        return  array
    }
}


var array = [4,9,5,6,3,1,7,8,2,14,11,13,12,18,15,19,16,20,17]

SelectionSort.sort(array: &array)
print(array)
