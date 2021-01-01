func testInt(_ number: Int) {
    switch number {
    case 1:
        print("1")
    case 2,3:// combine the two values into a compound case, separating the values with commas
        print("2,3")
    default:
        print("not 1,2,3")
    }
}

testInt(1)
testInt(2)
testInt(3)
testInt(4)


/// No Implicit Fallthrough
// Although break is not required in Swift, you can use a break statement to match and ignore a particular case or to break out of a matched case before that case has completed its execution.
// The body of each case must contain at least one executable statement.
// To explicitly fall through at the end of a particular switch case, use the fallthrough keyword

/// Interval Matching
func testInt2(_ number: Int) {
    switch number {
    case 0:
        print("0")
    case 1...9:
        print("1-9")
    default:
        print("<0 或 >9")
    }
}
testInt2(-1)
testInt2(0)
testInt2(1)
testInt2(10)

/// Tuples
func testPoint(_ point: (Int, Int)) {
    switch point {// x,y数轴上的点
    case (0,0):
        print("在原点")
    case (_, 0):
        print("在x轴")
    case (0, _):
        print("在y轴")
    case (-2...2, -2...2):
        print("在2x2框内")
    default:
        print("在2x2框外")
    }
}
testPoint((0,0))
testPoint((0,3))
testPoint((1,0))
testPoint((1,-1))
testPoint((3,3))
// allows multiple switch cases to consider the same value or values
// In fact, the point (0, 0) could match all four of the cases in this example. However, if multiple matches are possible, the first matching case is always used.


/// Value Bindings
func testPoint2(_ point: (Int, Int)) {
    switch point {
    case (let x,0):
        print("在x轴: \(x)")
    case let (x, y):// declares a tuple of two placeholder constants
        // 因为只选择第一个匹配的分支，因此铁定不在x轴
        print("不在x轴 x:\(x), y:\(y)")
    }
}
testPoint2((1,0))
testPoint2((1,1))

/// Where
func testPoint3(_ point: (Int, Int)) {
    switch point {
    case let (x, y) where x==y:
        print("在/上: \(x),\(y)")
    default:
        print("不在/上")
    }
}
testPoint3((1,1))
testPoint3((1,2))

/// Compound Cases
// Multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns.
// Compound cases can also include value bindings.
// All of the patterns of a compound case have to include the same set of value bindings, and each binding has to get a value of the same type from all of the patterns in the compound case.
func testPoint4(_ point: (Int, Int)) {
    switch point {
    case (let distance, 0), (0, let distance):
        print("离原点: \(distance)")
    default:
        print("不再轴上")
    }
}
testPoint4((1,0))
testPoint4((0,-2))
testPoint4((1,1))
