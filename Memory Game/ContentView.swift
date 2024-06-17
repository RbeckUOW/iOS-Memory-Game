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
    var body: some View {
        HStack {
            // Call the CardView struct into this stack
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct CardView: View {
    @State var isFaceUp = false // Default to face down
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) // Type inference for local variable for values of rectangle
            if isFaceUp { // Conditionals if the card is considered face up
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                Text("😏") .font(.largeTitle)
                    
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
