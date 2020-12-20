/// String and Character Equality

// “equal to” operator (==) and the “not equal to” operator (!=)
// Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.
// Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
print(latinCapitalLetterA==cyrillicCapitalLetterA)


/// Prefix and Suffix Equality

// hasPrefix(_:)
// hasSuffix(_:)
