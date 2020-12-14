class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

func testSquare() {
    let shape = Square(sideLength: 5.2, name: "my test square")
    print(shape.simpleDescription())
}

// testSquare()

// Subclasses include their superclass name after their class name, separated by a colon.
// There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

// Methods on a subclass that override the superclass’s implementation are marked with override


// cp "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/003_sub_super_override.swift" main.swift \
// && swiftc "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/002_init_self_deinit.swift" main.swift \
// && ./main