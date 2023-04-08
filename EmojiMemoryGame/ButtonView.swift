//
//  ButtonView.swift
//  EmojiMemoryGame
//
//  Created by Fazal on 07/04/23.
//

import SwiftUI

struct ButtonView: View {
    @State var buttonText : String
    @State var selected : Bool = true
    var body: some View{
        VStack {
            Text(buttonText).foregroundColor(.white).font(.system(size: 20)).padding()
        }.background(Color.red).cornerRadius(20).fixedSize()
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Preview sfjsdjdskj")
    }
}
