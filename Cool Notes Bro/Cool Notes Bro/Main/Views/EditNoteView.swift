//
//  EditNoteView.swift
//  Cool Notes Bro
//
//  Created by Justin Hold on 4/14/26.
//

import SwiftUI

struct EditNoteView: View {
    
    // MARK: - Properties
    @Bindable var note: Note
    
    
    // MARK: - View Body
    var body: some View {
        Form {
            TextField("Title", text: $note.title)
                .font(.title2)
            TextEditor(text: $note.content)
                .frame(minHeight: 200)
        }
        .navigationTitle("Edit Note")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditNoteView(note: Note(title: "", content: ""))
}
