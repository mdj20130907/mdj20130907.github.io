class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Use class followed by the class’s name to create a class.
// A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class.
// Likewise, method and function declarations are written the same way.

let shape = Shape()
// Create an instance of a class by putting parentheses after the class name.

shape.numberOfSides = 7
// class是引用类型，使用了let也可以修改property的值
print(shape.simpleDescription())
// Use dot syntax to access the properties and methods of the instance.
