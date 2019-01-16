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

print("All tests passed!")
