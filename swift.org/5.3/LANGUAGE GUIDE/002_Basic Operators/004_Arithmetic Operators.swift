// for all number types:
// Addition (+)
// Subtraction (-)
// Multiplication (*)
// Division (/)

// the Swift arithmetic operators don’t allow values to overflow by default
// Swift’s overflow operators (such as a &+ b)
let x = Int8.max &+ Int8(1)
print(type(of: x), Int8.max, x)

// The addition operator is also supported for String concatenation:
let r = "hello, " + "world"
print(r)

// remainder operator (a % b)
// The remainder operator (%) is also known as a modulo operator in other languages.
// However, its behavior in Swift for negative numbers means that,
// strictly speaking, it’s a remainder rather than a modulo operation.
print(9%4, -9%4)

// Unary Minus Operator
let y = 1
print(-y)

// Unary Plus Operator
print(+y)
// you can use it to provide symmetry in your code for positive numbers

