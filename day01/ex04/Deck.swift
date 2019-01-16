//
//  Deck.swift
//  
//
//  Created by Andriy Gordiychuk on 16/01/2019.
//

import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map{
        Card(color: .spade, value: $0)
    }
    
    static let allHearts: [Card] = Value.allValues.map{
        Card(color: .heart, value: $0)
    }
    
    static let allClubs: [Card] = Value.allValues.map{
        Card(color: .club, value: $0)
    }
    
    static let allDiamonds: [Card] = Value.allValues.map{
        Card(color: .diamond, value: $0)
    }
    
    static let allCards: [Card] = allSpades + allHearts + allClubs + allDiamonds
    
    var cards: [Card]
    var discards = [Card]()
    var outs = [Card]()
    
    override var description: String {
        return "\(cards)"
    }
    
    init(mixed:Bool) {
        cards = Array(Deck.allCards)
        if mixed {
            cards.shuffle()
        }
    }
    
    func draw() -> Card? {
        if cards.count == 0 {
            return nil
        }
        let card = cards[0]
        outs.append(cards[0])
        cards.remove(at: 0)
        return card
    }
    
    func fold(c: Card) {
        if (outs.contains(c) && (!discards.contains(c))) {
            discards.append(c)
        }
    }
    
}

extension Array {
    mutating func shuffle() {
        if self.count <= 1 {
            return
        }
        var new: [Element] = []
        while (self.count > 0) {
            let idx = Int(arc4random_uniform(UInt32(self.count - 1)))
            new.append(self[idx])
            self.remove(at: idx)
        }
        self.append(contentsOf: new)
    }
}
