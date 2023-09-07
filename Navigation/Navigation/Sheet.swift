//
//  Sheet.swift
//  Navigation
//
//  Created by Gabriel Mors  on 07/09/23.
//


// O .sheet é exibir uma tela modal, que é uma tela que aparece sobre a tela atual e é geralmente usada para ações temporárias ou configurações.


import SwiftUI

struct Sheet: View {
    
    @State var isSheetPresented = false
    
    var body: some View {
        Button("Mostrar Sheet") {
            isSheetPresented.toggle()
        }
        .sheet(isPresented: $isSheetPresented) {
            Text("Conteúdo da Modal")
        }
        
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
