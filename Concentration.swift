//
//  Concentration.swift
//  Concentration
//
//  Created by guhan-pt6208 on 28/11/22.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var noOfCards: Int
    
    var indexOfOneandOnlyFlipped: Int?
    
    init(noOfCards: Int) {
        self.noOfCards = noOfCards
        for _ in 1...noOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        // TODO: Shuffle cards to make the game better
//        var tempCards = [Card]()
//        for _ in 1...noOfCards * 2 {
//            let randomIndex = Int.random(in: 0..<cards.count)
//            tempCards.append(cards[randomIndex])
//            cards.remove(at: randomIndex)
//        }
//        cards = tempCards
    }
    
    func clickCard(of index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneandOnlyFlipped, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFlipped = true
                indexOfOneandOnlyFlipped = nil
            } else {
                for index in cards.indices {
                    cards[index].isFlipped = false
                }
                cards[index].isFlipped = true
                indexOfOneandOnlyFlipped = index
            }
        }
    }
}
				
