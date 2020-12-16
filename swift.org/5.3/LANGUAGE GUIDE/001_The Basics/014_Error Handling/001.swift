enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients(String)
}

func makeSandwich() throws {
    // throw SandwichError.outOfCleanDishes
    throw SandwichError.missingIngredients("tomato")
}

do {
    try makeSandwich()
    // eat
} catch SandwichError.outOfCleanDishes {
    print("SandwichError.outOfCleanDishes")
} catch SandwichError.missingIngredients(let ingredients) {
    print("SandwichError.missingIngredients", ingredients)
}

// swiftc 001.swift -o ~/develop/main && ~/develop/main