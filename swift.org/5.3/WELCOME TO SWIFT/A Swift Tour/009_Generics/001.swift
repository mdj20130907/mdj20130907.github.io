func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

let r = makeArray(repeating: "knock", numberOfTimes: 4)
print(r, type(of: r))

let s = makeArray(repeating: 1, numberOfTimes: 10)
print(s, type(of: s))

// Write a name inside angle brackets to make a generic function or type.
