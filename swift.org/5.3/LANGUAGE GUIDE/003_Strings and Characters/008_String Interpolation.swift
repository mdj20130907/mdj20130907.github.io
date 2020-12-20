// Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash (\)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

// You can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation.
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"Write an interpolated string in Swift using \#(multiplier)."#)

// The expressions you write inside parentheses within an interpolated string can’t contain an unescaped backslash (\), a carriage return, or a line feed.
