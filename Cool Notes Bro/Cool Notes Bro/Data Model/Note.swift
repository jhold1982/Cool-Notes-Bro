//
//  Note.swift
//  Cool Notes Bro
//
//  Created by Justin Hold on 4/14/26.
//

import Foundation
import SwiftData

@Model
final class Note {
    var title: String
    var content: String
    var timestamp: Date
    var category: Category?
    
    init(
        title: String = "",
        content: String = "",
        timestamp: Date = .now
    ) {
        self.title = title
        self.content = content
        self.timestamp = timestamp
    }
}

@Model
final class Category {
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Note.category) var notes: [Note] = []
    
    init(name: String) {
        self.name = name
    }
}
