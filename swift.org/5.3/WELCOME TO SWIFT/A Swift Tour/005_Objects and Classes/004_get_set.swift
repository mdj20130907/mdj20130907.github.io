class EquilateralTriangle: NamedShape {// 正三角形
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {// 周长
        // In addition to simple properties that are stored, properties can have a getter and a setter.
        get {
            return 3.0 * sideLength
        }
        set {
            // the new value has the implicit name newValue.
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

func testEquilateralTriangle() {
    let shape = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
    print(shape.perimeter)
    shape.perimeter = 9.9
    print(shape.sideLength)
}

// testEquilateralTriangle()
