//
//  Note.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []

    // Carregar as notas do UserDefaults durante a inicialização
    init() {
        if let data = UserDefaults.standard.data(forKey: "notes") {
            if let savedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                self.notes = savedNotes
            }
        }
    }

    // salvar as notas no UserDefaults
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }
}


struct Note: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var title: String = ""
    var content: String = ""
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.content == rhs.content
    }
}
