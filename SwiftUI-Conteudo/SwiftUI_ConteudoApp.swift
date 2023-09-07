//
//  SwiftUI_ConteudoApp.swift
//  SwiftUI-Conteudo
//
//  Created by Gabriel Mors  on 07/09/23.
//

import SwiftUI

@main
struct SwiftUI_ConteudoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
