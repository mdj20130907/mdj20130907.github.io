/// Dictionary Type Shorthand Syntax
// in full as Dictionary<Key, Value>
// in shorthand form as [Key: Value]
// the shorthand form is preferred

/// Creating an Empty Dictionary
var namesOfIntegers = [Int: String]()
// create an empty dictionary with an empty dictionary literal
namesOfIntegers[0] = "零"
namesOfIntegers = [:]

/// Creating a Dictionary with a Dictionary Literal
namesOfIntegers = [0:"零", 1:"一", ]

/// Accessing and Modifying a Dictionary
// read-only count property
print(namesOfIntegers.count)
// Boolean isEmpty property
print(namesOfIntegers.isEmpty)
// add a new item to a dictionary with subscript syntax
namesOfIntegers[2] = "二"
// use subscript syntax to change the value associated with a particular key
namesOfIntegers[1] = "一, one"
// updateValue(_:forKey:) method to set or update the value for a particular key
// returns the old value after performing an update
if let oldValue = namesOfIntegers.updateValue("二, two", forKey: 2) {
    print(oldValue)
}
// use subscript syntax to retrieve a value
if let value = namesOfIntegers[1] {
    print(value)
}
// use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key
namesOfIntegers[0] = nil
// remove a key-value pair from a dictionary with the removeValue(forKey:) method
// returns the removed value, or returns nil if no value existed
if let removedValue = namesOfIntegers.removeValue(forKey: 1) {
    print(removedValue)
}
print(namesOfIntegers)

/// Iterating Over a Dictionary
// iterate over the key-value pairs
for (k, v) in namesOfIntegers {
    print(k, v)
}
// retrieve an iterable collection of a dictionary’s keys or values
for k in namesOfIntegers.keys {
    print(k)
}
for v in namesOfIntegers.values {
    print(v)
}

let r1 = namesOfIntegers.keys
let r2 = [Int](r1)
print(type(of: r1), type(of: r2))
