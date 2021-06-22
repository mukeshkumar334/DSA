//Approach-1
func pow1(_ base: Int, _ num: Int) -> Int {
    if num == 0 {
        return 1
    }
    return base * pow1(base, num-1)
}

//Approach-2
func pow2(_ base: Int, _ num: Int) -> Int {
    if num == 0 {
        return 1
    }
    if num % 2 == 0 {
        let x = pow2(base, num/2)
        return x*x
    } else {
        let x = pow2(base, num/2)
        return base*x*x
    }
}

let base = 2
let num = 7
print(pow1(base, num))
//TC: O(n) -> total number of function call * total time taken by per function call

//SC: O(n) -> max number of function call at a time * space taken by per function call

print(pow2(base, num))
//TC: O(logn) -> total number of recursion * total time taken by per function call

//SC: O(logn) -> max number of function call at a time * space taken by per function call
