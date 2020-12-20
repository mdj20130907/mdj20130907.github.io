// Unicode is an international standard for encoding, representing, and processing text in different writing systems.

/// Unicode Scalar Values

// Behind the scenes, Swift’s native String type is built from `Unicode scalar values`.
// A Unicode scalar value is a unique 21-bit number for a character or modifier

// Note that not all 21-bit Unicode scalar values are assigned to a character

/// Extended Grapheme Clusters

// Every instance of Swift’s `Character` type represents a single `extended grapheme cluster`.
// An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.

let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́
print(eAcute==combinedEAcute, eAcute)

let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
print(precomposed==decomposed, precomposed)

// Extended grapheme clusters enable scalars for enclosing marks (such as COMBINING ENCLOSING CIRCLE, or U+20DD) to enclose other Unicode scalars as part of a single Character value
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print(enclosedEAcute)

// Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(regionalIndicatorForUS)

// TODO: why