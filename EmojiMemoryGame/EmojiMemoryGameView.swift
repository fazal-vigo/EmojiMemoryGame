//
//  EmojiMemoryGameView.swift
//  Emoji Memory Game
//
//  Created by Fazal on 12/12/22.
//
// This is the View

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        if !game.isCompleted {
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.chooseCards(card)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }else{
            Text("You have won! 🥳🎉")
                .font(.title)
                .foregroundColor(.red)
                .fontWeight(.bold)
        }
    }
}

struct CardView : View {
    let card: EmojiMemoryGame.Card
   
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp {
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.linWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.foregroundColor(.red)
                }
            }

        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let linWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        // Since EmojiMemoryGameView is a struct, we need to initialize it ourself.
        // So we initialize it with game var which is just EmojiMemorygame object
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}

