//
//  ViewController.swift
//  Concentration
//
//  Created by guhan-pt6208 on 27/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    // The below is to create Conc var and with how many cards
    lazy var game = Concentration(noOfCards: (cardButtons.count + 1) / 2) ///Can't use prop obs in lazy var
    var count = 0 {
        didSet {
            flipCount.text = "Flips : \(count)"   ///each time it changed also changes flipcount
        }
    }
    var emojis = ["👻", "💀", "🎃", "😈", "🧙", "😱", "🐶", "🤖"]
    @IBOutlet weak var flipCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func startGame(_ sender: UIButton) {
        game = Concentration(noOfCards: (cardButtons.count + 1) / 2)
        count = 0
        for i in 0..<game.cards.count {
            game.cards[i].isFlipped = false
        }
        emojis = ["👻", "💀", "🎃", "😈", "🧙", "😱", "🐶", "🤖"]
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let indexNumber = cardButtons.firstIndex(of: sender) {
            count += 1
            game.clickCard(of: indexNumber)
            updateViewFromModel()
        }
    }
    
    // MARK: Update View 
    func updateViewFromModel() {
        
        for index in cardButtons.indices {  // .indices returns countable range of int
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFlipped {
                button.backgroundColor = #colorLiteral(red: 0, green: 0.4752213955, blue: 0.9254299998, alpha: 1)
                button.setTitle(getEmoji(in: card), for: UIControl.State.normal)
            } else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5686540008, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5686540008, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    
    var emoji = [Int: String]()
    func getEmoji(in card: Card) -> String {
        
        if emoji[card.id] == nil, emojis.count > 0 {
            let randomIndex = Int.random(in:0..<emojis.count)
            emoji[card.id] = emojis.remove(at: randomIndex)
        }
        
        return emoji[card.id] ?? "?"
    }

}

