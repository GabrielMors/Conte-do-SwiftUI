//
//  NotesListView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct NotesListView: View {
    @State private var notes: [Note] = []
    @State private var isAddingNote = false
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    
    var body: some View {
        List {
            ForEach($notes) { $note in
                NavigationLink(destination: NoteDetailView(note: $note)) {
                    HStack {
                        Image(systemName: "pencil")
                            .symbolRenderingMode(.multicolor)
                            .symbolEffect(.variableColor.iterative)
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .onDelete(perform: deleteNotes)
        }
        .navigationBarTitle("Notas")
        .navigationBarItems(trailing: Button(action: {
            isAddingNote = true
        }) {
            Text("Adicionar")
        })
        .sheet(isPresented: $isAddingNote, content: {
            AddNoteView(isPresented: $isAddingNote) { title, content in
                // Função de salvamento
                let newNote = Note(title: title, content: content)
                notes.append(newNote)
            }
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
