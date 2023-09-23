//
//  AddNotesView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct AddNoteView: View {
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    
    let onSave: () -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Título")) {
                TextField("Digite o título", text: $newNoteTitle)
            }
            
            Section(header: Text("Conteúdo")) {
                TextEditor(text: $newNoteContent)
            }
            
            Section {
                Button(action: onSave) {
                    Text("Salvar")
                }
            }
        }
        .navigationBarTitle("Nova Nota")
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(onSave: {})
    }
}
