// The assignment operator (a = b) initializes or updates the value of a with the value of b:
let b = 10
var a = 5
a = b

// If the right side of the assignment is a tuple with multiple values,
// its elements can be `decomposed` into multiple constants or variables at once:
let (x,y) = (1,2)

// the assignment operator in Swift does not itself return a value
print(a = 1)
// TODO: ? 为什么能打印出来东西
