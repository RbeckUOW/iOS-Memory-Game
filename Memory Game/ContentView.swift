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
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"] // Array for emoji display
    
    @State var cardCount: Int = 4 // Set the card count to display 4 initially
    // State set to track number of cards and increase/decrease
    
    var body: some View {
        VStack {
            cardDisplay
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardDisplay: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in // from 0 to the card count value
                CardView(content: emojis[index])
            } // For each entry in the emojis array, create a card
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.medium)
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        Button (action: {
            if cardCount > 1 { // Prevent removing cards past 1
                cardCount -= 1 // Remove a card from the display
            }
        }, label: {
            Image(systemName: "minus")
        })
    }
    
    var cardAdder: some View {
        Button (action: {
            if cardCount < emojis.count { // Only add the amount of cards that are in the array
                cardCount += 1 // Add a card to the display
            }
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct CardView: View {
    let content: String // Force variable content to display the entered string
    @State var isFaceUp = true // Default to face up
    
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
