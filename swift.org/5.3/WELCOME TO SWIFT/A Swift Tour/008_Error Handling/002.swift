var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers",]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
let r = fridgeContains("banana")
print(r, fridgeIsOpen)

// Use `defer` to write a block of code that is executed after all other code in the function, just before the function returns.
// The code is executed regardless of whether the function throws an error.
// You can use `defer` to write setup and cleanup code next to each other, even though they need to be executed at different times.
