enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.hearts
print(hearts.simpleDescription())

// The case values of an enumeration are actual values, not just another way of writing their raw values.
// In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
