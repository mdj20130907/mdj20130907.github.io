extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
var seven = 7
seven.adjust()
print(seven.simpleDescription)

// Use extension to add functionality to an existing type, such as new methods and computed properties.
// You can use an extension to add protocol conformance to a type that is declared elsewhere,
// or even to a type that you imported from a library or framework.
