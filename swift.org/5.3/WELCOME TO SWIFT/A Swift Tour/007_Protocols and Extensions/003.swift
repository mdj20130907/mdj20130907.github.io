let a = SimpleClass()
print(a.aNonProtocolProperty)

let protocolValue: ExampleProtocol = a
// print(protocolValue.aNonProtocolProperty)
// error: value of type 'ExampleProtocol' has no member 'aNonProtocolProperty'

// You can use a protocol name just like any other named type
// —for example, to create a collection of objects that have different types but that all conform to a single protocol.
// When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
