//
//  AddNotesView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: NoteViewModel
    @State var note: Note = Note()
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section {
                TextField("Digite o título", text: $note.title)
            } header: {
                Text("Título")
            }

            Section {
                TextEditor(text: $note.content)
            } header: {
                Text("Conteúdo")
            }
            
            Section {
                Button(action: {
                    viewModel.notes.append(note)
                    viewModel.saveNotes()
                    dismiss()
                }) {
                    Text("Salvar")
                }
            }
        }
        .navigationBarTitle("Nova Nota")
    }
}


struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NoteViewModel()
        let note = Note(title: "Título", content: "Conteúdo")
        return AddNoteView(viewModel: viewModel, note: note)
    }
}
