//
//  Card.swift
//  Concentration
//
//  Created by guhan-pt6208 on 28/11/22.
//

import Foundation

struct Card {
    
    var isFlipped = false
    var isMatched = false
    var id: Int = generateId()
    
    static var idGenerator: Int = 0
    
    static func generateId() -> Int {
        idGenerator += 1
        return idGenerator
    }
    
    
}
