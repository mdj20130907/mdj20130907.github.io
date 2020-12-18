// The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value,
// or returns a default value b if a is nil.

// If the value of a is non-nil, the value of b is not evaluated.
// This is known as short-circuit evaluation.

let defualtColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defualtColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defualtColorName
print(colorNameToUse)