//
//  ContentView.swift
//  Memory Game
//
//  Created by Ryan Beck on 17/06/2024.
//

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    let emojis = ["😂", "😏", "😇", "🥹"] // Array for emoji display
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            } // For each entry in the emojis array, create a card
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct CardView: View {
    let content: String // Force variable content to display the entered string
    @State var isFaceUp = false // Default to face down
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // Type inference for local variable for values of rectangle
            if isFaceUp { // Conditionals if the card is considered face up
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                Text(content) .font(.largeTitle)
                    
            } else { // If card is face down
                base.fill()
            }
        } 
        .onTapGesture { // Inline Function View modifier for when card is pressed on
            isFaceUp.toggle() //Toggle if card is face up or down
            
        }
    }
}







#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
