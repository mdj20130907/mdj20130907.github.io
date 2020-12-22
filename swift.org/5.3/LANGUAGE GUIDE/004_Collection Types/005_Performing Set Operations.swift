/// Fundamental Set Operations
// intersection(_:)=> create a new set with only the values common to both sets
// symmetricDifference(_:)=> create a new set with values in either set, but not both
// union(_:)=> create a new set with all of the values in both sets
// subtracting(_:)=> create a new set with values not in the specified set

// symmetric 对称

let odd: Set = [1,3,5,7,9,]
let even: Set = [0,2,4,6,8,]
let prime: Set = [2,3,5,7,]

print(odd.union(even).sorted())
print(odd.intersection(even).sorted())
print(odd.subtracting(prime).sorted())
print(odd.symmetricDifference(prime).sorted())// 所有不共有的

/// Set Membership and Equality
// `==` => whether two sets contain all of the same values
// isSubset(of:)=> whether all of the values of a set are contained in the specified set
// isSuperset(of:)=> whether a set contains all of the values in a specified set
// isStrictSubset(of:) or isStrictSuperset(of:)=> but not equal to
// isDisjoint(with:)=>  whether two sets have no values in common
let a:Set = ["🐶"]
let b:Set = ["🐶", "🐱"]
let c:Set = ["🐭"]
print(a.isSubset(of: b))
print(a.isStrictSubset(of: b))
print(b.isStrictSuperset(of: a))
print(a.isDisjoint(with: c))
