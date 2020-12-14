let r = [1,2,3,].map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(r)

// Functions are actually a special case of closures:
// blocks of code that can be called later.
// The code in a closure has access to things like variables and functions that were available in the scope where the closure was created,
// even if the closure is in a different scope when it is executed
// —you saw an example of this already with nested functions.
// You can write a closure without a name by surrounding code with braces ({}).
// Use in to separate the arguments and return type from the body.

let s = [1,2,3,].map({number in 3 * number})
print(s)

let t = [1,2,3,].map { 3 * $0 }
print(t)

let u = [1,3,2,].sorted { $0 > $1 }
print(u)
