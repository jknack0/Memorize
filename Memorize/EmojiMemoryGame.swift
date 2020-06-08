//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jon Knack on 5/28/20.
//  Copyright © 2020 Jon Knack. All rights reserved.
//

import SwiftUI

func createCardContent(pairIndex: Int) -> String {
    return "🧐"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🧐", "👹", "👾", "🥶", "👽"]
        let pairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: pairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
