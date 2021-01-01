for item in [1,3,2,] {
    print(item)
}

for (k, v) in ["a":1, "c":3, "b":2,] {
    print(k, v)
}
// the order you insert items into a Dictionary doesn’t define the order they are iterated

for index in 1...5 {
    print(index)
}

for character in "hello" {
    print(character)
}

// underscore character (_)
// closed range operator (...)
// half-open range operator (..<)
for _ in 1...3 {
    print("哈")
}

for x in stride(from: 0, to: 10, by: 5) {
    print(x)
}

for x in stride(from: 0, through: 10, by: 5) {
    print(x)
}
