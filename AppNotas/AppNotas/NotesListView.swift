//
//  NotesListView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI


@available(iOS 17.0, *)
struct NotesListView: View {
    @State private var notes: [Note] = []
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    
    
    var body: some View {
        List {
            Image(systemName: "pencil")
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.variableColor.iterative)
            
            ForEach(notes) { note in
                NavigationLink(destination: NoteDetailView(note: note, onDelete: { self.delete(note: note) })) {
                    Text(note.title)
                }
            }
            .onDelete(perform: deleteNotes)
        }
        .navigationTitle("Notas")
        .navigationBarItems(trailing: NavigationLink(destination: AddNoteView(onSave: addNote)) {
            Text("Adicionar")
        })
    }
    
    // Função para adicionar uma nota
    func addNote() {
        let newNote = Note(title: newNoteTitle, content: newNoteContent)
        notes.append(newNote)
        newNoteTitle = ""
        newNoteContent = ""
    }
    
    // Função para deletar uma nota
    func delete(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
    }
    
    // Função para deletar várias notas
    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            NotesListView()
        } else {
            // Fallback on earlier versions
        }
    }
}
