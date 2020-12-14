class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

func testTriangleAndSquare() {
    let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
    print(triangleAndSquare.square.sideLength)
    print(triangleAndSquare.triangle.sideLength)

    triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
    print(triangleAndSquare.triangle.sideLength)
}

testTriangleAndSquare()

// If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet.
// The code you provide is run any time the value changes outside of an initializer.
