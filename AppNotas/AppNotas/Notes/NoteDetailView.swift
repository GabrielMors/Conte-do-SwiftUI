//
//  NoteDetailView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct NoteDetailView: View {
    
    @Binding var note: Note
    @State var noteState: Note
    @Environment(\.dismiss) var dismiss
    
    init(note: Binding<Note>) {
        _note = note
        _noteState = State(initialValue: note.wrappedValue)
    }
    
    var body: some View {
        VStack {
            TextField("Título", text: $noteState.title)
                .font(.title)
            TextEditor(text: $noteState.content)
        }
        .padding()
        .navigationBarTitle("Detalhes")
        .navigationBarItems(trailing: Button(action: {
            note = noteState
            dismiss()
        }) {
            Text("Salvar")
        }.disabled(isDifferent))
    }
    
    private var isDifferent: Bool {
        note == noteState
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    @State static var note = Note(title: "Exemplo de Título", content: "Conteúdo de Exemplo")
    
    static var previews: some View {
        NavigationView {
            NoteDetailView(note: $note)
        }
    }
}

