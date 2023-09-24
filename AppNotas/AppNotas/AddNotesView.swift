//
//  AddNotesView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct AddNoteView: View {
    
    @Binding var isPresented: Bool
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    
    let onSave: (String, String) -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Título")) {
                TextField("Digite o título", text: $newNoteTitle)
            }
            
            Section(header: Text("Conteúdo")) {
                TextEditor(text: $newNoteContent)
            }
            
            Section {
                Button(action: {
                    onSave(newNoteTitle, newNoteContent)
                    isPresented = false // Feche a tela após salvar
                }) {
                    Text("Salvar")
                }
            }
        }
        .navigationBarTitle("Nova Nota")
    }
}


struct AddNoteView_Previews: PreviewProvider {
    @State static var isPresented = false
    static var previews: some View {
        AddNoteView(isPresented: $isPresented) { title, content in
            // Esta é uma implementação de onSave para a pré-visualização
        }
    }
}

