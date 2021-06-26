//Given a sorted array, find the number of pairs which sums to K.
func pairCount(in array: [Int], k: Int) -> Int { 
    var i=0, j = array.count-1
    var pairCount = 0
    while i < j {
        if array[i] + array[j] > k {
            j -= 1
        } else if array[i] + array[j] < k {
            i += 1
        } else {
            if array[i] != array[j] { 
                var prevI = i
                var prevJ = j
                while array[i+1] == array[prevI] {
                    i += 1
                }
                
                while array[j-1] == array[prevJ] {
                    j -= 1
                }
                pairCount += (i-prevI+1)*(prevJ-j+1)
                i += 1
                j -= 1
            } else {
                pairCount += (j-i+1)
                break
            }
        }
    }
    return pairCount
}
//Test
let array = [1,4,4,5,5,5,6,6,11]
print(pairCount(in: array, k: 11))
