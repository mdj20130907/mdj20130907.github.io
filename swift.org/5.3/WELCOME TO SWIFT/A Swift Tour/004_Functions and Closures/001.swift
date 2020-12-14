func sayHi(toPerson: String, onDay: String) -> String {
    return "Hi, \(toPerson), today is \(onDay)."
}
let r = sayHi(toPerson: "John", onDay: "monday")
print(r)

// Use func to declare a function.
// Call a function by following its name with a list of arguments in parentheses.
// Use -> to separate the parameter names and types from the function’s return type.

func sayHello(to person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
let s = sayHello(to: "Doggy", on: "tuesday")
print(s)
// By default, functions use their parameter names as labels for their arguments.
// Write a custom argument label before the parameter name,
// or write _ to use no argument label.

func sayHeyTo(_ person: String, on day: String) -> String {
    return "Hey \(person), today is \(day)."
}
let t = sayHeyTo("Jj", on: "Wednesday")
print(t)


// parameter name 函数定义的时候
// argument label 函数调用的时候