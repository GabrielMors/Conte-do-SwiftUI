//
//  ContentView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var textField = ""
    @State var textFieldPassword = ""
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Text("Login")
                    .font(.system(size: 55))
                    .padding(.top, 10)
                HStack {
                    Text("E-mail")
                        .padding(.bottom, -5)
                        .padding(.top, 70)
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 8)
                    .frame( height: 40)
                    .foregroundColor(.white)
                    .overlay {
                        TextField(" Type your e-mail:", text: $textField)
                    }
                HStack {
                    Text("Password")
                        .padding(.bottom, -5)
                    Spacer()
                }
                .padding(.top, 20)
                RoundedRectangle(cornerRadius: 8)
                    .frame( height: 40)
                    .foregroundColor(.white)
                    .overlay {
                        TextField(" Type your Password:", text: $textField)
                    }
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 130, height: 40)
                    Button("Log in") {
                    }.foregroundColor(.white).font(.system(size: 17, weight: .bold))
                }
                .padding(.top, 20)
                .padding(.bottom, 250)
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 130, height: 40)
                    .overlay {
                        Button("Exib") {
                        }
                        .foregroundColor(.red).font(.system(size: 17, weight: .bold))
                    }
                Spacer()
            }
            .padding(.horizontal, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
