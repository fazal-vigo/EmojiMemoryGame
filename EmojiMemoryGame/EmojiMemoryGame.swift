//
//  EmojiMemoryGame.swift
//  Emoji Memory Game
//
//  Created by Fazal on 13/12/22.
//
//  This is the ViewModel

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍", "🛺", "🚔"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    

    // the ViewModel's job is to protect the Model against ill-behaving Views or anyone else really
    // who has access to the ViewModel. And one of the ways we do that is by making our Model private.
    // Initialization of MemoryGame Struct has createCardContent function at the end that returns a value of
    // type CardContent which is generic, so we are just adding the function outside of variable initialization
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var isCompleted : Bool {
        return model.cards.allSatisfy { $0.isMatched }
    }
    
    // MARK: - Intent(s)
    
    func chooseCards(_ card: Card){
        model.chooseCards(card)
    }
    
}
