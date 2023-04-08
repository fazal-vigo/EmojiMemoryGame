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
    private static let level = [8,16,24]
    private static var selected = 0
    private static var emoji = emojis.smileys
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: level[selected]) { pairIndex in
            emoji[pairIndex]
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
    
    func play() {
        EmojiMemoryGame.emoji.shuffle()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func selectLevel(_ level: Int){
        EmojiMemoryGame.selected = level
    }
    
    func selectType(_ type: Int){
        switch type {
        case 0:
            EmojiMemoryGame.emoji = emojis.smileys
        case 1:
            EmojiMemoryGame.emoji = emojis.flags
        case 2:
            EmojiMemoryGame.emoji = emojis.food
        default:
            EmojiMemoryGame.emoji = emojis.smileys
        }
    }
    
}
