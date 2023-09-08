//
//  onReceiveContent.swift
//  Life-Cycle
//
//  Created by Gabriel Mors  on 08/09/23.
//


// onReceive é usado para observar e reagir a mudanças em publicações (Publishers) ou objetos observáveis. Nesse caso, você deve fornecer um Publisher como entrada para o onReceive, e o código será executado quando o Publisher emitir um valor.

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var someData: String = ""
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        // Configurar um Publisher simulado para emitir valores
        let somePublisher = Just("Valor Inicial")
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .sink { [weak self] newValue in
                // Executa ação quando o Publisher emite um valor
                self?.someData = newValue
            }
        
        somePublisher
            .store(in: &cancellables)
    }
}

struct onReceiveContent: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Text(viewModel.someData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        onReceiveContent()
    }
}
