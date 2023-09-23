//
//  Note.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}
