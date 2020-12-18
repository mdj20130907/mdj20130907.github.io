//  if you assign a literal value of 42 to a new constant without saying what type it is,
// Swift infers that you want the constant to be an Int

let a = 42
print(type(of: a))

//  if you don’t specify a type for a floating-point literal,
// Swift infers that you want to create a Double
let b = 3.14159
print(type(of: b))
