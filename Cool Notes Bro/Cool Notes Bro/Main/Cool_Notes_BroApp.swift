//
//  Cool_Notes_BroApp.swift
//  Cool Notes Bro
//
//  Created by Justin Hold on 4/14/26.
//

import SwiftUI
import SwiftData

@main
struct Cool_Notes_BroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Note.self, Category.self])
    }
}
