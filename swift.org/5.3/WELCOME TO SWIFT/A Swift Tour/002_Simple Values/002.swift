let implicitInteger = 1
let implicitDouble = 1.0
print("implicitInteger", type(of: implicitInteger))
print("implicitDouble", type(of: implicitDouble))
// Providing a value when you create a constant or variable lets the compiler infer its type.

let explicityInteger: Int
let explicitDouble: Double = 1
let explicityFloat: Float = 1
print("explicityInteger", type(of: explicityInteger))
print("explicitDouble", type(of: explicitDouble))
print("explicityFloat", type(of: explicityFloat))
// If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.