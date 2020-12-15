enum PrinterError: Error,  {
    case outOfPaper
    case noToner// 没墨粉了
    case onFire
}

struct NetworkError: Error {
    let message = "network is broken"
}
// You represent errors using any type that adopts the Error protocol.

func send(job: Int, to printer: String) throws -> String {
    if printer == "Broken Printer" {
        throw PrinterError.outOfPaper
        // throw PrinterError.noToner
        // throw PrinterError.onFire
        // throw NetworkError()
    }
    return "Job sent"
}
// Use `throw` to throw an error and `throws` to mark a function that can throw an error.
// If you throw an error in a function, the function returns immediately and the code that called the function handles the error.

do {
    // let printerResponse = try send(job: 1040, to: "Bi Sheng")
    let printerResponse = try send(job: 1040, to: "Broken Printer")
    print(printerResponse)
} catch PrinterError.outOfPaper {
    print("PrinterError.outOfPaper")
} catch let printerError as PrinterError {
    print("PrinterError", printerError)
} catch {
    print("error", error)
}
// There are several ways to handle errors.
// One way is to use do-catch.
// Inside the do block, you mark code that can throw an error by writing try in front of it.
// Inside the catch block, the error is automatically given the name error unless you give it a different name.

// You can provide multiple catch blocks that handle specific errors.
// You write a pattern after catch just as you do after case in a switch.

if let printerResponse = try? send(job: 1884, to: "Broken Printer") {
    print(printerResponse)
}
// Another way to handle errors is to use try? to convert the result to an optional.
// If the function throws an error, the specific error is discarded and the result is nil.
// Otherwise, the result is an optional containing the value that the function returned.

