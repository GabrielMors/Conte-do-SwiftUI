//
//  Register.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI
import Firebase

struct Register: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPresentedAlert: Bool = false
    @State private var isPresentedNotesListView: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Register")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
                Group {
                    TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                        .keyboardType(.emailAddress)
                    SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
                    SecureField("", text: $confirmPassword, prompt: Text("Confirm password").foregroundStyle(.white))
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
                    registerUser()
                }) {
                    Text("Register")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(isDisabledRegisterButton ? Color.pinkColor.opacity(0.5) : Color.pinkColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .disabled(isDisabledRegisterButton)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
        .navigationDestination(isPresented: $isPresentedNotesListView, destination: {
            NotesListView()
        })
        .alert("Attention!", isPresented: $isPresentedAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private var isDisabledRegisterButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password != confirmPassword
    }
    
    func registerUser() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error {
                    errorMessage = "Error: \(error.localizedDescription)"
                    isPresentedAlert.toggle()
                } else {
                    isPresentedNotesListView.toggle()
                }
            }
        } else {
            errorMessage = "Check password and confirm password and try again"
            isPresentedAlert.toggle()
        }
    }
}



struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Register()
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
                .previewDisplayName("Iphone 15")
            
            Register()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE 3rd generation"))
                .previewDisplayName("Iphone SE")
        }
    }
}

