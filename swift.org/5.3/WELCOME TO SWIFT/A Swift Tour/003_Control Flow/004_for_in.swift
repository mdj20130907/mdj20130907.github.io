let interestingNumbers = [
    "Prime": [2,3,5,7,11,13,],
    "Fibonacci": [1,1,2,3,5,8,],
    "Square": [1,4,9,16,25,],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            print("number \(number) of \(kind)")
        }
    }
}
print(largest)

for i in 0..<4 {
    print(i)
}
// You can keep an index in a loop by using ..< to make a range of indexes.
// ..< [), ... []
