func anyCommonElements<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
let r = anyCommonElements([1,2,3,], [3,])
print(r)
// Use `where` right before the body to specify a list of requirements—for example,
// to require the type to implement a protocol,
// to require two types to be the same,
// or to require a class to have a particular superclass.


// https://developer.apple.com/documentation/swift/sequence
// https://developer.apple.com/documentation/swift/sequence/2908099-element
func getCommonElements<T,U>(_ lhs: T, _ rhs: U) -> some Sequence
    where T: Sequence, U:Sequence, T.Element: Equatable, T.Element == U.Element
{
    var r = [T.Element]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                r.append(lhsItem)
            }
        }
    }
    return r
}
let a = Set<Int>([3,4,])
let b = [1,2,3,]
let s = getCommonElements(a, b)
print(a, b, s)
// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable.