// let optionalNamedShape: NamedShape?
// error: constant 'optionalNamedShape' used before being initialized
// global scope里没有默认值

let optionalNamedShape: NamedShape? = nil

// let optionalNamedShape: NamedShape? = NamedShape(name: "optional named shape")

let optionalNumberOfSides = optionalNamedShape?.numberOfSides
// `?`是写在`.`前头，而不是`optionalNamedShape`的后头
if let numberOfSides = optionalNumberOfSides {
    print(numberOfSides)
}

// When working with optional values, you can write ? before operations like methods, properties, and subscripting.
// If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil.
// Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value.
// In both cases, the value of the whole expression is an optional value.
