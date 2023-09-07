//
//  NavigationLinkContent.swift
//  Navigation
//
//  Created by Gabriel Mors  on 07/09/23.
//


//O NavigationLink é usado para criar links entre telas em seu aplicativo
//Quando um usuário toca em um NavigationLink, ele navega para a tela de destino especificado.



import SwiftUI

struct NavigationLinkContent: View {
    var body: some View {
        NavigationView {
            NavigationLink("Ir para a próxima tela", destination: Text("Conteúdo da segunda tela!!!"))
        }
    }
}

struct NavigationLinkContent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkContent()
    }
}
