
extension Array where Element: Comparable {
    public mutating func quickSort() {
        quickSort(low: 0, high: count-1)
    }
    
    private mutating func quickSort(low: Int, high: Int) {
        
        guard low <= high else { return}
        
        let pivot = partition(low: low, high: high)
        quickSort(low: low, high: pivot-1)
        quickSort(low: pivot+1, high: high)
    }
    
    private mutating func partition(low: Int, high: Int) -> Int {
        var pivot = low
        
        for i in low..<high {
            if self[i] < self[high] {
                if pivot != i {
                    swapElement(at: i, withElementAt: pivot)
                }
                pivot += 1
            }
        }
        
        if pivot < high {
            swapElement(at: pivot, withElementAt: high)
        }
        return pivot
    }
    
    private mutating func swapElement(at i: Int, withElementAt j: Int) {
        let temp = self[i]
        self[i] = self[j]
        self[j] = temp
    }
}

//test 
var array = [2, 1, 6, 10, 4, 1, 3, 9, 7]
array.quickSort()
print(array)
//output: [1, 1, 2, 3, 4, 6, 7, 9, 10]
