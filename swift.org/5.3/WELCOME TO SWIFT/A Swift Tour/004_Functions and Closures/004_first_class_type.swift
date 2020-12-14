func makeIncrementer() -> ((Int)->Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}
let increment = makeIncrementer()
print(increment(2))

// Functions are a first-class type.
// This means that a function can return another function as its value.

func hasAnyMatches(list: [Int], condition: (Int)->Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
print(hasAnyMatches(list: [20,9,7,12,], condition: lessThanTen))

// A function can take another function as one of its arguments.