/// Hash Values for Set Types
// A type must be hashable in order to be stored in a set

/// Set Type Syntax
// Set<Element>

/// Creating and Initializing an Empty Set
var letters = Set<Character>()
print(letters.count)

letters.insert("a")
// create an empty set with an empty array literal
letters = []
print(letters)

/// Creating a Set with an Array Literal
var s1: Set<Int> = [1,3,2,]
// A set type cannot be inferred from an array literal alone, so the type Set must be explicitly declared.
// However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type.
var s2: Set = [2,3,1,]
print(type(of: s2))

/// Accessing and Modifying a Set
// read-only count property
print(s2.count)
// Boolean isEmpty property
print(s2.isEmpty)
// insert(_:) method
s2.insert(5)
// remove(_:) method
if let removedItem = s2.remove(1) {
    print(".remove(1)", removedItem)
}
// returns the removed value, or returns nil if the set did not contain it
// removeAll()
s2.removeAll()
print(s2)
// contains(_:)
print(".contains(1)", s1.contains(1))

/// Iterating Over a Set
for i in s1 {
    print(i, terminator: " ")
}
let r1 = s1.sorted()
print(type(of: r1), r1)
