let aConstant: Int
var aVariable: Int
// Use let to make a constant and var to make a variable.

aVariable = 1
print("aVariable", aVariable)

aVariable = 2
print("aVariable", aVariable)

aConstant = aVariable * 2
print("aConstant", aConstant)

// aConstant = 3
// print("aConstant", aConstant)
// error: immutable value 'aConstant' may only be initialized once

// The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once.
// This means you can use constants to name a value that you determine once but use in many places.
