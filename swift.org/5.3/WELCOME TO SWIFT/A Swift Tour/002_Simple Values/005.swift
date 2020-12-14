let quotation1 = """
    1st row
    2nd row
        3rd row
    """
print(quotation1)
print("------------------------")

// Use three double quotation marks (""") for strings that take up multiple lines.
// Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks.

let x = 1, y = 2
let quotation2 = """
1
+
2
=\(1+2)
"""
print(quotation2)
print("------------------------")

print(quotation1 + quotation2)
print("------------------------")

print(quotation1 + "\n" + quotation2)
print("------------------------")
