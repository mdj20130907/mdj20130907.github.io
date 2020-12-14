let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let optionalSideLength = optionalSquare?.sideLength
// `?`是写在`.`前头，而不是`optionalSquare`的后头
if let sideLength = optionalSideLength {
    print(sideLength)
}

// When working with optional values, you can write ? before operations like methods, properties, and subscripting.
// If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil.
// Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value.
// In both cases, the value of the whole expression is an optional value.
