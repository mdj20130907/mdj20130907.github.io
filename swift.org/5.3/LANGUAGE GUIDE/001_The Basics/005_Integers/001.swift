// Integer Bounds

print(UInt8.min, UInt8.max)
print(UInt16.min, UInt16.max)
print(UInt32.min, UInt32.max)
print(UInt64.min, UInt64.max)

print(Int8.min, Int8.max)
print(Int16.min, Int16.max)
print(Int32.min, Int32.max)
print(Int64.min, Int64.max)


// Int

// Swift provides an additional integer type, Int,
// which has the same size as the current platform’s native word size:
// On a 32-bit platform, Int is the same size as Int32.
// On a 64-bit platform, Int is the same size as Int64.

// Unless you need to work with a specific size of integer, always use Int for integer values in your code.

// UInt

// Swift also provides an unsigned integer type, UInt,
// which has the same size as the current platform’s native word size:
// On a 32-bit platform, UInt is the same size as UInt32.
// On a 64-bit platform, UInt is the same size as UInt64.

// Use UInt only when you specifically need an unsigned integer type with the same size as the platform’s native word size.
// If this isn’t the case, Int is preferred, even when the values to be stored are known to be nonnegative.
