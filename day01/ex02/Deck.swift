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
    
}
