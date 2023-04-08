//
//  MemoryGameLevel.swift
//  EmojiMemoryGame
//
//  Created by Fazal on 07/04/23.
//

import SwiftUI

struct MemoryGameLevel: View {
    @State var selectedLevel = 0
    var body: some View {
        NavigationView {
        VStack{
            Text("Choose game level:")
            HStack (spacing: 10){
                ButtonView(buttonText: "Easy")
                    .onTapGesture(perform: {
                        selectedLevel = 0
                    })
                ButtonView(buttonText: "Medium", selected: false)
                    .onTapGesture(perform: {
                        selectedLevel = 1
                    })
                ButtonView(buttonText: "Hard", selected: false)
                    .onTapGesture(perform: {
                        selectedLevel = 2
                    })
            }.padding(.bottom, 50)
            NavigationLink(destination: EmojiMemoryGameView(game: EmojiMemoryGame())) {
                ButtonView(buttonText: "START")
            }.navigationBarHidden(true).navigationBarTitle("").navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct MemoryGameLevel_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameLevel()
    }
}
