let label = "The width is "
let width = 2
let widthLabel = label + String(width)
print(widthLabel)

// let widthLabel2 = label + width
// error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'

// Values are never implicitly converted to another type.
// If you need to convert a value to a different type, explicitly make an instance of the desired type.