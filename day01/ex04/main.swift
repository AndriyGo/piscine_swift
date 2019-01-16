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

let arr1 = Array(Deck.allCards)
var arr2 = Array(Deck.allCards)

var sorted = false
var retry = 0
while (!sorted && (retry < 10)) {
    arr2.shuffle()
    assert(arr1.count == arr2.count, "Error: array count different after shuffle")
    for item in arr1 {
        assert(arr2.contains(item), "Error: lost item after shuffle()")
        let idx1 = arr1.index(of: item)
        let idx2 = arr2.index(of: item)
        sorted = sorted || (idx1 != idx2)
    }
    if sorted {
        break
    }
    retry += 1
}
assert(sorted, "Error: couldn't sort Deck.allCards with 10 retries")

let deck = Deck(mixed: true)
assert(deck.cards.count == 52, "Error: deck.cards count is \(deck.cards.count) instead of 52")
var i = 0
while i < 52 {
    let card = deck.cards[0]
    let card2 = deck.draw()
    assert(card == card2, "Error: drawn card not equal to first card in deck")
    assert(deck.outs.last == card, "Error: drawn card not placed in outs")
    var count = 0
    for c in Deck.allCards {
        deck.fold(c: c)
        deck.fold(c: c)
        if deck.outs.contains(c) {
            assert(deck.discards.contains(c), "Error: Fold did not place card from outs to discards")
            if deck.outs.last == c {
                assert(deck.discards.last == c, "Error: Fold did not place last card from outs to the end of discards")
            }
            count += 1
        }
        else {
            assert(deck.discards.contains(c) == false, "Error: Fold placed card to discards which is not in outs")
        }
    }
    assert(deck.discards.count == count, "Error: wrong number of cards in discard")
    i += 1
}
assert(deck.discards.count == 52, "Error: wrong number of cards in discard")
let card2 = deck.draw()
assert(card2 == nil, "Error: drawn non-nil card with empty deck")



print("All tests passed!")
