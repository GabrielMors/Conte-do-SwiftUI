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
        NavigationStack {
            ZStack {
                CustomColor.backgroundColor.ignoresSafeArea()
                VStack(spacing: 25) {
                    
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Group {
                        TextField("", text: $email, prompt: Text("E-mail").foregroundColor(.gray))
                            .keyboardType(.emailAddress)
                        SecureField("", text: $password, prompt: Text("Password").foregroundColor(.gray))
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(CustomColor.pinkColor, lineWidth: 2)
                    )
                    .padding(7)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    
                    Spacer()
                    
                    Button(action: {
                        isLoginActive = true
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 180, height: 45)
                            .background(CustomColor.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isRegisterActive.toggle()
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
            .navigationDestination(isPresented: $isRegisterActive) {
                Register()
            }
            .navigationDestination(isPresented: $isLoginActive) {
                NotesListView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

