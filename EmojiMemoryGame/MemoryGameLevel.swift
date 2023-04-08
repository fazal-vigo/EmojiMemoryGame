//
//  MemoryGameLevel.swift
//  EmojiMemoryGame
//
//  Created by Fazal on 07/04/23.
//

import SwiftUI

struct MemoryGameLevel: View {
    @StateObject var game : EmojiMemoryGame
    @State var selectedLevel = 0
    var body: some View {
        NavigationView {
            VStack{
                Text("Choose game level:")
                HStack (spacing: 10){
                    ButtonView(buttonText: "Easy", selected: selectedLevel == 0 ? true:false)
                        .onTapGesture(perform: {
                            game.selectLevel(0)
                            selectedLevel = 0
                        })
                    ButtonView(buttonText: "Medium", selected: selectedLevel == 1 ? true:false)
                        .onTapGesture(perform: {
                            game.selectLevel(1)
                            selectedLevel = 1
                        })
                    ButtonView(buttonText: "Hard", selected: selectedLevel == 2 ? true:false)
                        .onTapGesture(perform: {
                            game.selectLevel(2)
                            selectedLevel = 2
                        })
                }.padding(.bottom, 50)
                NavigationLink(destination: EmojiMemoryGameView(game: game)) {
                    ButtonView(buttonText: "START")
                }.navigationBarTitle("Menu")
            }
        }.accentColor(.red)
    }
}

struct MemoryGameLevel_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameLevel(game: EmojiMemoryGame())
    }
}
