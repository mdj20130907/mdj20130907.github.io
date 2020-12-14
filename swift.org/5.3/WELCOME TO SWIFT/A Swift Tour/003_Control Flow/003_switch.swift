let vegetable = "red pepper"// 红椒
switch vegetable {
case "celery":
    print("芹菜")
case "cucumber", "watercress":
    print("黄瓜", "西洋菜")
case let x where x.hasSuffix("pepper"):
    print("一种椒")
default:
    print("default")
// 此处default case不能去掉
// error: switch must be exhaustive
}


// Switches support any kind of data and a wide variety of comparison operations
// —they aren’t limited to integers and tests for equality.

// After executing the code inside the switch case that matched,
// the program exits from the switch statement.
// Execution doesn’t continue to the next case,
// so there is no need to explicitly break out of the switch at the end of each case’s code.