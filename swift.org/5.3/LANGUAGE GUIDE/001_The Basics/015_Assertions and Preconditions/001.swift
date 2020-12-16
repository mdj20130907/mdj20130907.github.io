// Assertions and preconditions are checks that happen at runtime.
// You use them to make sure an essential condition is satisfied before executing any further code.

// Unlike the error conditions discussed in Error Handling above, assertions and preconditions aren’t used for recoverable or expected errors.
// Because a failed assertion or precondition indicates an invalid program state, there’s no way to catch a failed assertion.

// The difference between assertions and preconditions is in when they’re checked:
// Assertions are checked only in debug builds,
// but preconditions are checked in both debug and production builds.




// Debugging with Assertions
let age = 3
assert(age > 0, "A person's age can't be less than zero.")

assertionFailure("assertion failure message.")

// TODO: production builds?