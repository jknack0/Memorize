//
//  ContentView.swift
//  Memorize
//
//  Created by Jon Knack on 5/27/20.
//  Copyright © 2020 Jon Knack. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        return HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture { self.viewModel.choose(card: card) }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(viewModel.cards.count == 5 ? Font.largeTitle : Font.title)
            .aspectRatio(2.5, contentMode: .fit)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
