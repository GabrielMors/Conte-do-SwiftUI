//
//  NotesListView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct NotesListView: View {
    @StateObject var viewModel = NoteViewModel()
    @State private var isAddingNote = false
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    
    var body: some View {
        List {
            ForEach($viewModel.notes) { $note in
                NavigationLink {
                    NoteDetailView(note: $note)
                } label: {
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
            .onDelete { indexSet in
                viewModel.notes.remove(atOffsets: indexSet)
                viewModel.saveNotes()
            }
            .onMove { sourceIndices, destinationIndex in
                viewModel.notes.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                viewModel.saveNotes()
            }
        }
        
        .navigationBarTitle("Notas")
        .navigationBarItems(trailing: Button(action: {
            isAddingNote.toggle()
        }) {
            Text("Adicionar")
        })
        .sheet(isPresented: $isAddingNote, content: {
            AddNoteView(viewModel: viewModel)
        })
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotesListView()
        }
    }
}
