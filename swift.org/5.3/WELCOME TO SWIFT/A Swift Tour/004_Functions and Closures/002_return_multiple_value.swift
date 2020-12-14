func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            // 如果不大于max，才来与min比小
            // 大于max的话，必然不小于min
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let r = calculateStatistics(scores: [1,7,2,4,6,3,])
print("min", r.0)
print("max", r.max)

// Use a tuple to make a compound value.
// The elements of a tuple can be referred to either by name or by number.