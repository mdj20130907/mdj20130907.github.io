/// String Indices

// Each String value has an associated index type, `String.Index`,
// which corresponds to the position of each Character in the string.

let s1 = "hi"
// startIndex
print(s1[s1.startIndex])
// endIndex
print(s1[s1.index(before:s1.endIndex)])

// print(s1[s1.endIndex])
// Fatal error: String index is out of bounds

// If a String is empty, startIndex and endIndex are equal.
let s2 = ""
print(s2.startIndex == s2.endIndex)

// index(before:)
// index(after:)
// index(_:offsetBy:)

for index in s1.indices {
	print(index, s1[index])
}

// You can use the startIndex and endIndex properties and the index(before:), index(after:), and index(_:offsetBy:) methods on any type that conforms to the Collection protocol.
// This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

/// Inserting and Removing

var s3 = "hello"
s3.insert("!", at: s3.endIndex)
print(s3)

s3.insert(contentsOf: "hi", at: s3.endIndex)
print(s3)

s3.remove(at: s3.index(before: s3.endIndex))
print(s3)

let range = s3.index(s3.endIndex, offsetBy: -2)..<s3.endIndex
s3.removeSubrange(range)
print(s3)

// You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol.
// This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.
