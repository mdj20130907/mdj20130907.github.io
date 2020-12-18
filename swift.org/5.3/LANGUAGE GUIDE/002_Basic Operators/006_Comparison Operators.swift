// Swift supports the following comparison operators:
// Equal to (a == b)
// Not equal to (a != b)
// Greater than (a > b)
// Less than (a < b)
// Greater than or equal to (a >= b)
// Less than or equal to (a <= b)

// Swift also provides two identity operators (=== and !==),
// which you use to test whether two object references both refer to the same object instance.

let name = "world"
if "world" == name {
    print("同")
}

// Tuples are compared from left to right, one value at a time,
// until the comparison finds two values that aren’t equal.
print( (3, "apple") < (3, "bird") )

// Tuples can be compared with a given operator only if the operator can be applied to each value in the respective tuples.
// ("blue", false) < ("purple", true)

// The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements.
