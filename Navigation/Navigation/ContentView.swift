//
//  ContentView.swift
//  Navigation
//
//  Created by Gabriel Mors  on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Conteúdo da primeira tela")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Primeira tela")
                }
            Text("Conteúdo da segunda tela")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Segunda tela")
                }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
