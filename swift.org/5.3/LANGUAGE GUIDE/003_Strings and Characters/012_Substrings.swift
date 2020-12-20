// Substring

// unlike strings, you use substrings for only a short amount of time while performing actions on a string.
// When you’re ready to store the result for a longer time, you convert the substring to an instance of String.

let s1 = "hello, world!"
let sub1 = s1[..<(s1.firstIndex(of: ",") ?? s1.endIndex)]
print(type(of: sub1))

let s2 = String(sub1)
print(type(of: s2))

// substrings aren’t suitable for long-term storage
