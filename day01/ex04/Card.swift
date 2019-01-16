//
//  Card.swift
//  
//
//  Created by Andriy Gordiychuk on 16/01/2019.
//

import Foundation

class Card: NSObject {
    
    let color: Color
    let value: Value
    
    override var description: String {
        return "\(color.rawValue) \(value.rawValue)"
    }
    
    init(color:Color, value:Value) {
        self.color = color
        self.value = value
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let rhs = object as? Card {
            return ((color == rhs.color) && (value == rhs.value))
        }
        return false
    }
    
}

func == (lhs: Card, rhs: Card) -> Bool {
    return ((lhs.color == rhs.color) && (lhs.value == rhs.value))
}
