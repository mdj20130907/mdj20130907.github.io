for item in [1,3,2,] {
    print(item)
}

for (k, v) in ["a":1, "c":3, "b":2,] {
    print(k, v)
}

for index in 1...5 {
    print(index)
}

// underscore character (_)
// closed range operator (...)
// half-open range operator (..<)
for _ in 1...3 {
    print("哈", terminator: "")
}

for x in stride(from: 0, to: 10, by: 5) {
    print(x)
}

for x in stride(from: 0, through: 10, by: 5) {
    print(x)
}
