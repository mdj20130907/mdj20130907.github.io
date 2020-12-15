struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())."
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Use struct to create a structure.
// Structures support many of the same behaviors as classes, including methods and initializers.
// One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.

func testCard() {
    for rankRawValue in 1...13 {
        for suit in [Suit.spades, .hearts, .diamonds, .clubs] {
            if let rank = Rank(rawValue: rankRawValue) {
                let card = Card(rank: rank, suit: suit)
                print(card)
            }
        }
    }
}

testCard()