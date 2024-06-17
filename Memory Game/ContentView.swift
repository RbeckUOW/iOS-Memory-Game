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
            /// Call the CardView struct into this stack
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
    var isFaceUp: Bool = false /// Default to face down
    var body: some View {
        ZStack {
            if isFaceUp { /// Conditionals if the card is considered face up or down
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("😏")
                    .font(.largeTitle)
                    
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}







#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
