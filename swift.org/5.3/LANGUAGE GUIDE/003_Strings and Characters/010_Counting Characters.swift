var word = "cafe"
print(word.count)

word += "\u{301}"
print(word.count)

// the number of characters in a string can’t be calculated without iterating through the string to determine its extended grapheme cluster boundaries
// If you are working with particularly long string values,
// be aware that the count property must iterate over the Unicode scalars in the entire string in order to determine the characters for that string.
