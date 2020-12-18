// Floating-point literals can be decimal (with no prefix), or hexadecimal (with a 0x prefix).
// They must always have a number (or hexadecimal number) on both sides of the decimal point.
// Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e;
// hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p.

let a = 1.25e2, b = 1.25e-2 // 10^
print(a, b)

let c = 0xFp2, d = 0xFp-2 // 2^
print(c, d)

print(0xC.3p0, 12+3/16.0)