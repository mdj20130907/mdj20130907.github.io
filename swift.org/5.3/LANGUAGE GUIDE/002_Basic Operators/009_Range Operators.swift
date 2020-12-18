// closed range operator (a...b)
// The closed range operator is useful when iterating over a range in which you want all of the values to be used
for i in 1...5 {
    print(i)
}

// half-open range operator (a..<b)
// Half-open ranges are particularly useful when you work with zero-based lists such as arrays
let names = ["Anna", "Alex",]
for i in 0..<names.count {
    print(names[i])
}

// one-sided range
// The closed range operator has an alternative form for ranges that continue as far as possible in one direction
print("-------")
for name in names[1...] {
    print(name)
}

print("-------")
for name in names[...1] {
    print(name)
}

// The half-open range operator also has a one-sided form that’s written with only its final value.
print("-------")
for name in names[..<1] {
    print(name)
}

// One-sided ranges can be used in other contexts, not just in subscripts.
// You can’t iterate over a one-sided range that omits a first value, because it isn’t clear where iteration should begin.
// You can iterate over a one-sided range that omits its final value; however, because the range continues indefinitely, make sure you add an explicit end condition for the loop.
// You can also check whether a one-sided range contains a particular value, as shown in the code below.
let range = ...5
print("-------")
print(range.contains(4))
