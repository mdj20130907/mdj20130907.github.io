enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print(sunrise, sunset)
case let .failure(message):
    print(message)
}

// If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value.
// Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance, and they can be different for each instance of an enumeration case.
// You can think of the associated values as behaving like stored properties of the enumeration case instance.

// Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.