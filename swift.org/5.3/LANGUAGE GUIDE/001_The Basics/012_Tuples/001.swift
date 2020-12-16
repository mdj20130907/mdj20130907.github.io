// Tuples group multiple values into a single compound value.
// The values within a tuple can be of any type and don’t have to be of the same type as each other.

let http404Error = (404, "Not Found")
// a tuple of type (Int, String)
print(http404Error, type(of: http404Error))

// decompose
// ignore parts of the tuple with an underscore (_)
let (statusCode, _) = http404Error
print(statusCode)

// access the individual element values in a tuple using index numbers starting at zero
print(http404Error.0)

// name the elements in a tuple,
// you can use the element names to access the values of those elements
let http200Status = (statusCode:200, statusMessage: "OK")
print(http200Status.statusCode, http200Status.statusMessage)

// Tuples are useful for simple groups of related values.
// They’re not suited to the creation of complex data structures.
