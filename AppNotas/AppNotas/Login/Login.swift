//
//  ContentView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 20/09/23.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isRegisterActive = false
    @State private var isLoginActive = false
    
    var body: some View {
        ZStack {
            CustomColor.backgroundColor.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Login")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(CustomColor.pinkColor, lineWidth: 2)
                    )
                    .padding(.top, 70)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(CustomColor.pinkColor, lineWidth: 2)
                    )
                    .padding(.bottom, 100)
                
                Spacer()
                Button(action: {
                    isLoginActive = true
                }) {
                    
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 130, height: 40)
                        .background(CustomColor.pinkColor)
                        .cornerRadius(8)
                }
                NavigationLink("", destination: NotesListView(), isActive: $isLoginActive)
                              .opacity(0)
                              .frame(width: 0, height: 0)
                Spacer()
                
                Button(action: {
                    isRegisterActive = true
                }) {
                    
                    Text("Don't have an account? Register")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(height: 40)
                }
                NavigationLink("", destination: Register(), isActive: $isRegisterActive)
                              .opacity(0)
                              .frame(width: 0, height: 0)
                      
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

