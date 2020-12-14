func return15() -> Int {
    var x = 10
    func add5() {
        x += 5
    }
    add5()
    return x
}
print(return15())

// Functions can be nested.
// Nested functions have access to variables that were declared in the outer function.