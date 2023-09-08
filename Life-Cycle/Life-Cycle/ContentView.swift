//
//  ContentView.swift
//  Life-Cycle
//
//  Created by Gabriel Mors  on 08/09/23.
//

//No SwiftUI, o ciclo de vida de uma view é gerenciado pelo sistema.
//Não há métodos explícitos como viewDidLoad ou viewWillAppear que você encontra em UIKit.

import SwiftUI

struct ContentView: View {
    init() {
//   Este é o estágio inicial, quando uma view é inicializada. Você pode executar configurações iniciais, como definir propriedades.
    }

    var body: some View {
//   O método body é onde você define a estrutura da view. Este método é chamado sempre que os dados relacionados à view mudam e a interface do usuário precisa ser atualizada.
        
        
//-------------- onAppear e onDisappear --------------
        
        
        Text("Hello aluno")
        .onAppear {
            // Código a ser executado quando a view aparece
        }
        .onDisappear {
            // Código a ser executado quando a view desaparece
        }
    }
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
