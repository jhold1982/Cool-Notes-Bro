//
//  ContentView.swift
//  Cool Notes Bro
//
//  Created by Justin Hold on 4/14/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Note.timestamp, order: .reverse) private var notes: [Note]
    
    
    // MARK: - View Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: EditNoteView(note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title.isEmpty ? "New Note" : note.title)
                                .font(.headline)
                            Text(note.timestamp, format: .dateTime.month().day())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteNotes) 
            }
            .navigationTitle("Cool Notes Bro")
            .toolbar {
                Button(action: addNote) {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }
    }
    
    // MARK: - Logic
    private func addNote() {
        let newNote = Note(title: "", content: "")
        modelContext.insert(newNote)
    }
    
    private func deleteNotes(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(notes[index])
        }
    }
}

#Preview {
    ContentView()
}
