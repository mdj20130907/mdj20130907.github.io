enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

// Use enum to create an enumeration.
// Like classes and all other named types, enumerations can have methods associated with them.

// By default, Swift assigns the raw values starting at zero and incrementing by one each time,
// but you can change this behavior by explicitly specifying values.
// In the example above, Ace is explicitly given a raw value of 1, and the rest of the raw values are assigned in order. 

// Use the rawValue property to access the raw value of an enumeration case.

if let convertedRank = Rank(rawValue: 3) {
    print(convertedRank.simpleDescription())
}
// Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.