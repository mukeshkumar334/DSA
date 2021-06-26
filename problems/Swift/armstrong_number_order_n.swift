//Armstrong number

func isAmrstrong(number: Int) -> Bool {
    var num = number
    var order = "\(number)".count
    var sum = 0
    while num > 0 {
        let lastDigit = num % 10
        sum += pow(lastDigit, order)
        num = num/10
    }
    return sum == number
}

func pow(_ base: Int, _ order: Int) -> Int {
    if order == 0 {
        return 1
    }
    
    if order % 2 == 0 {
        let x = pow(base, order/2)
        return x*x
    } 
    
    let x = pow(base, order/2)
    return base * x * x
}

print(isAmrstrong(number: 88593477))
