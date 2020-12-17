// Use the Int type for all general-purpose integer constants and variables in your code,
// even if they’re known to be nonnegative.

/// Integer Conversion

// Because each numeric type can store a different range of values,
// you must opt in to numeric type conversion on a case-by-case basis.

// To convert one specific number type to another,
// you initialize a new number of the desired type with the existing value.
let r = UInt16(1)
print(r)

/// Integer and Floating-Point Conversion

// Floating-point values are always truncated when used to initialize a new integer value in this way.
let integerPi = Int(3.1415926)
print(integerPi)

// The rules for combining numeric constants and variables are different from the rules for numeric literals.
// The literal value 3 can be added directly to the literal value 0.14159,
// because number literals don’t have an explicit type in and of themselves.
// Their type is inferred only at the point that they’re evaluated by the compiler.
