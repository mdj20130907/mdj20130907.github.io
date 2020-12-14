class NamedShape {
    var numberOfSides: Int = 0

    let name: String
    init(name: String) {
        self.name = name
        // an initializer to set up the class when an instance is created. Use init to create one.
        // Notice how self is used to distinguish the name property from the name argument to the initializer.
    }

    deinit {
        print("deinit")
        // Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Use class followed by the class’s name to create a class.
// A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class.
// Likewise, method and function declarations are written the same way.

let shape = NamedShape(name: "三角形")
// The arguments to the initializer are passed like a function call when you create an instance of the class.
// Every property needs a value assigned—either in its declaration (as with numberOfSides) or in the initializer (as with name).

shape = nil
// deinit调用