// string literal
let someString = "some string literal value"

/// Multiline String Literals
let s1 = """
    1st line
    2nd line
        3rdline
    4th line!!!
"""
print(s1 + someString)
// The string begins on the first line after the opening quotation marks (""") and ends on the line before the closing quotation marks
// 上边最后一行结束的换行符不包括在字符串里

// line break
// backslash (\)
let s2 = """
hi,\
hello
"""
print(s2)

// To make a multiline string literal that begins or ends with a line feed,
// write a blank line as the first or last line.
let s3 = """

hi

"""
print(s3)

// A multiline string can be indented to match the surrounding code.
let s4 = """
    1st line
        2nd line
    """
print(s4)

/// Special Characters in String Literals

// The escaped special characters
// \0 (null character),
// \\ (backslash),
// \t (horizontal tab),
// \n (line feed),
// \r (carriage return),
// \" (double quotation mark)
// and \' (single quotation mark)
let s5 = "hi\n"
print(s5)

// An arbitrary Unicode scalar value,
// written as \u{n}, where n is a 1–8 digit hexadecimal number
let s6 =  "\u{24}"
print(s6)

let s7 = """
\"""
"""
print(s7)

/// Extended String Delimiters
print("Line1\nLine2")
print(#"Line1\nLine2"#)
print(#"Line1\#nLine2"#)
print(##"Line1\##nLine2"##)// also break
let s8 = #"""
"""
"""#
print(s8)

print("12\\n34")// 是为了简化这种操作吗
