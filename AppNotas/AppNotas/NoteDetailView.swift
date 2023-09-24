//
//  NoteDetailView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct NoteDetailView: View {
    @Binding var note: Note
    
    var body: some View {
        VStack {
            TextField("Título", text: $note.title)
                .font(.title)
            TextEditor(text: $note.content)
                .padding()
        }
        .navigationBarTitle("Detalhes")
        .navigationBarItems(trailing: Button(action: {
            
        }) {
            Text("Salvar")
        })
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

