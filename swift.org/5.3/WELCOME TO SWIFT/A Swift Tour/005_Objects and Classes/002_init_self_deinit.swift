class NamedShape {
    var numberOfSides: Int = 0

    let name: String
    init(name: String) {
        self.name = name
        // an initializer to set up the class when an instance is created. Use init to create one.
        // Notice how self is used to distinguish the name property from the name argument to the initializer.
        print("init", name)
    }

    deinit {
        // Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
        print("deinit", name)
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

func testNamedShape() {
    let shape = NamedShape(name: "三角形")
    print(shape.simpleDescription())
    // The arguments to the initializer are passed like a function call when you create an instance of the class.
    // Every property needs a value assigned—either in its declaration (as with numberOfSides) or in the initializer (as with name).

    // 在函数里执行，可以触发deinit调用
}

// testNamedShape()