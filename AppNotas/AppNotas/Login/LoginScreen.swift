//
//  ContentView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 20/09/23.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    
    let pinkColor = Color(red: 230/255, green: 0/255, blue: 126/255)
    let backgroundColor = Color(red: 17/255, green: 21/255, blue: 30/255)
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Login")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    .padding(.top, 70)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    .padding(.bottom, 100)
                
                Spacer()
                Button(action: {
                    // Coloque a lógica de login aqui
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 130, height: 40)
                        .background(pinkColor)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Don't have an account? Register")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(height: 40)
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

