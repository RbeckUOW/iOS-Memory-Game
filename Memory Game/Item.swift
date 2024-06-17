//
//  Item.swift
//  Memory Game
//
//  Created by Ryan Beck on 17/06/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
