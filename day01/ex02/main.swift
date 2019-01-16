//
//  main.swift
//  
//
//  Created by Andriy Gordiychuk on 16/01/2019.
//

var raws = ["club", "diamond", "heart", "spade"]

for raw in raws {
    let color = Color(rawValue: raw)
    if let a = color {
        assert(Color.allValues.contains(a), "Error: Color.allValues does not contain \(raw)")
    }
    else {
        assertionFailure("Error: Color has no case with raw value \(raw)")
    }
}

var raws2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

for raw in raws2 {
    let value = Value(rawValue: raw)
    assert(value != nil, "Error: Value has no case with raw value \(raw)")
    if let a = value {
        assert(Value.allValues.contains(a), "Error: Value.allValues does not contain \(raw)")
    }
    else {
        assertionFailure("Error: Value has no case with raw value \(raw)")
    }
}

for raw in raws {
    for raw2 in raws2 {
        let card1 = Card(color: Color(rawValue: raw)!, value: Value(rawValue: raw2)!)
        for raw3 in raws {
            for raw4 in raws2 {
                let card2 = Card(color: Color(rawValue: raw3)!, value: Value(rawValue: raw4)!)
                if ((raw3 == raw) && (raw4 == raw2)) {
                    assert(card1 == card2, "Error: (\(raw), \(raw2)) != (\(raw3), \(raw4))")
                    assert(card1.isEqual(card2) == true, "Error: (\(raw), \(raw2)) isNotEqual (\(raw3), \(raw4))")
                }
                else {
                    assert(card1 != card2, "Error: (\(raw), \(raw2)) == (\(raw3), \(raw4))")
                    assert(card1.isEqual(card2) == false, "Error: (\(raw), \(raw2)) isEqual (\(raw3), \(raw4))")
                }
            }
        }
    }
}

let card = Card(color: .spade, value: .ace)
assert(card.isEqual(nil) == false, "Error: initialized card isEqual to nil")
assert(card.description == "spade 1", "Error: description is wrong \(card.description)")

assert(Deck.allCards.count == 52, "Error: Deck.allCards count is \(Deck.allCards.count) instead of 52!")

for color in raws {
    for value in raws2 {
        let card = Card(color: Color(rawValue:color)!, value: Value(rawValue: value)!)
        assert(Deck.allCards.contains(card), "Error: Deck.allCards does not contain \(card)")
        if card.color == .spade {
            assert(Deck.allSpades.contains(card), "Error: Deck.allSpades does not contain \(card)")
        }
        else if card.color == .club {
            assert(Deck.allClubs.contains(card), "Error: Deck.allClubs does not contain \(card)")
        }
        else if card.color == .heart {
            assert(Deck.allHearts.contains(card), "Error: Deck.allHearts does not contain \(card)")
        }
        else {
            assert(Deck.allDiamonds.contains(card), "Error: Deck.allDiamonds does not contain \(card)")
        }
    }
}
print("All tests passed!")
