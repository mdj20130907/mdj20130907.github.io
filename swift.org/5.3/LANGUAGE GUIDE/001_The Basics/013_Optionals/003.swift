// Optional Binding

if let number = Int("123") {
    print(number)
}

// If the optional Int returned by Int(possibleNumber) contains a value,
// set a new constant called actualNumber to the value contained in the optional.


// You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas.
// If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false.
if 5>1, 5<6 {
    print("是的")
}