// if 5 {}
// not an implicit comparison to zero
// error: type 'Int' cannot be used as a boolean; test for '!= 0' instead
// In an if statement, the conditional must be a Boolean expression

var optionalString: String? = "Hello"
print(optionalString == nil)
// You can use if and let together to work with values that might be missing. These values are represented as optionals.
// An optional value either contains a value or contains nil to indicate that a value is missing.
// Write a question mark (?) after the type of a value to mark the value as optional.

if let s = optionalString {
    print(s)
} else {
    print("optionalString is nil")
}
// If the optional value is nil, the conditional is false and the code in braces is skipped.
// Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.

print(optionalString ?? "optionalString is nil, this is a default value.")

// Another way to handle optional values is to provide a default value using the ?? operator.
// If the optional value is missing, the default value is used instead.