protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
// Use `protocol` to declare a protocol.


class SimpleClass: ExampleProtocol {
    var simpleDescription = "A very simple class."
    var aNonProtocolProperty = "can you see me?"// for 3.swift
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription = " A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

// Classes, enumerations, and structs can all adopt protocols.

// Notice the use of the `mutating` keyword in the declaration of SimpleStructure to mark a method that modifies the structure.
// The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.

func testProtocol() {
    let a = SimpleClass()
    a.adjust()
    print(a.simpleDescription)

    var b = SimpleStructure()
    b.adjust()
    print(b.simpleDescription)
}

// testProtocol()