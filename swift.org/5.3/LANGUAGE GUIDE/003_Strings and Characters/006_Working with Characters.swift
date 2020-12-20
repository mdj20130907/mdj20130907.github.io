for character in "Dog!🐶" {
    print(character)
}

// you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation
let exclamationMark: Character = "!"

// String values can be constructed by passing an array of Character values as an argument to its initializer
let c1: [Character] = ["C", "a", "t"]
let s1 = String(c1)
print(s1)
