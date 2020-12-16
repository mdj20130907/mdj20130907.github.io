// Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
print(forcedString)


let assumedString: String! = "An implicitly unwrapped optional string."
let r1 = assumedString// 未明确类型，推断为可空类型
print(type(of: r1))
let implicitString: String = assumedString// 明确了String类型
print(type(of:implicitString))

if nil != assumedString {
    print(assumedString!)// 需要!
}

if let definiteString = assumedString {
    print(definiteString)
}
