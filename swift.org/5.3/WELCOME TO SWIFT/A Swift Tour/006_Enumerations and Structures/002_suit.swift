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
let heartsDescription = hearts.simpleDescription()
print(hears, heartsDescription)
print(hearts.rawValue)

// The case values of an enumeration are actual values, not just another way of writing their raw values.
// In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.

// Notice the two ways that the hearts case of the enumeration is referred to above:
// When assigning a value to the hearts constant, the enumeration case Suit.hearts is referred to by its full name because the constant doesn’t have an explicit type specified.
// Inside the switch, the enumeration case is referred to by the abbreviated form .hearts because the value of self is already known to be a suit.
// You can use the abbreviated form anytime the value’s type is already known.
