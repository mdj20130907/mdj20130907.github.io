// Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another.

// continue
// break
// fallthrough
// return
// throw

// The `continue` statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.

// The `break` statement ends execution of an entire control flow statement immediately.
// The break statement can be used inside a switch or loop statement
// Because Swift’s switch statement is exhaustive and does not allow empty cases, it is sometimes necessary to deliberately match and ignore a case in order to make your intentions explicit.
// A switch case that contains only a comment is reported as a compile-time error.

// If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the `fallthrough` keyword.
// The fallthrough keyword does not check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.

/// Labeled Statements
// you can mark a loop statement or conditional statement with a statement label
// A labeled statement is indicated by placing a label on the same line as the statement’s introducer keyword, followed by a colon.

/// Early Exit
// You use a `guard` statement to require that a condition must be true in order for the code after the guard statement to be executed.
// If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.
// If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block in which the guard statement appears. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError(_:file:line:).

/// Checking API Availability
if #available(iOS 10, macOS 10.12, *) {
    print("yes")
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    print("no")
    // Fall back to earlier iOS and macOS APIs
}