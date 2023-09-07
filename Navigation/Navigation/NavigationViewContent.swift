//
//  NavigationViewContent.swift
//  Navigation
//
//  Created by Gabriel Mors  on 07/09/23.
//

//O NavigationView é usado parao para criar uma estrutura de navegação.
//Ele geralmente contém uma barra de navegação na parte superior da tela, que pode incluir um título e botões de navegação, como "Voltar".



import SwiftUI

struct NavigationViewContent: View {
    var body: some View {
        NavigationView {
            Text("Conteúdo da tela principal")
                .navigationBarTitle("Título da Tela")
        }
    }
}

struct NavigationViewContent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewContent()
    }
}
