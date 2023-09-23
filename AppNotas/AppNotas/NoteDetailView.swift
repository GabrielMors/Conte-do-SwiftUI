//
//  NoteDetailView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    let onDelete: () -> Void
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
            Text(note.content)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Detalhes")
        .navigationBarItems(trailing: Button(action: onDelete) {
            Text("Excluir")
        })
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: Note(title: "Example title", content: "Example Content"), onDelete: {})
    }
}
