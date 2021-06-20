


//In-place approach
func merge(_ array: inout [Int], l: Int, m: Int, r: Int) {
    //Insertion sort
    var i = m
    
    while i <= r   {
        var j = i
        
        while j > 0 && array[j] < array[j-1] {
            //swap
            let temp = array[j]
            array[j] = array[j-1]
            array[j-1] = temp
            j -= 1
        }
        
        i += 1
    }
}

func divide(_ array: inout [Int], l: Int, r: Int) {
    if r >= l {
        print(array[l...r])
    }
    //base-case
    if  l < r {
        let mid = l + ((r - l) / 2)
        //Devide
        divide(&array, l: l, r: mid)
        divide(&array, l: mid+1, r: r)
        
        //Conquer
        merge(&array, l: l, m: mid, r: r)
    }
}

func sort(_ array: inout [Int]) {
    divide(&array, l: 0, r: array.count-1)
}

//Test
var array = [5, 6, 7, 11, 12, 13]
sort(&array)

array = [12, 11, 13, 5, 6, 7]
sort(&array)

array = [10, 14, 28, 11, 7, 16, 30, 50, 25, 18, 10, 3, 12, 7, 2, 11, 9]
sort(&array)

array = [10, 14, 28, 11, 7, 16, 30, 12, 11, 13, 5, 6, 7, 50, 25, 18, 10, 3, 12, 7, 2, 11, 9]
sort(&array)

