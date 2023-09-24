//
//  ContentView.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 20/09/23.
//

import SwiftUI
import Firebase

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isRegisterActive = false
    @State private var isLoginActive = false
    @State private var isPresentedAlert: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing: 25) {
                    
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Group {
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.pinkColor, lineWidth: 2)
                    )
                    .padding(7)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    
                    Spacer()
                    
                    Button(action: {
                        isLoginActive.toggle()
                    }) {
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 180, height: 45)
                            .background(Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        loginUser()
                    }) {
                        Text("Don't have an account? Register")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .frame(height: 40)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
            .alert("Attention!", isPresented: $isPresentedAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .navigationDestination(isPresented: $isRegisterActive) {
                Register()
            }
            .navigationDestination(isPresented: $isLoginActive) {
                NotesListView()
            }
        }
    }
    
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                errorMessage = "Error: \(error.localizedDescription)"
                isPresentedAlert.toggle()
            } else {
                isLoginActive.toggle()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

