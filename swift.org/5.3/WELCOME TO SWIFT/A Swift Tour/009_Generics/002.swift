enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger = OptionalValue<Int>.none
print(possibleInteger, type(of: possibleInteger))

possibleInteger = .some(100)
print(possibleInteger)

switch possibleInteger {
case .none:
    print("none")
case let .some(x):
    print("some", x)
}

// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
