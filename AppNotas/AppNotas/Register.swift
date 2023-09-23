//
//  Register.swift
//  AppNotas
//
//  Created by Gabriel Mors  on 23/09/23.
//

import SwiftUI

struct Register: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""

    
    let pinkColor = Color(red: 230/255, green: 0/255, blue: 126/255)
    let backgroundColor = Color(red: 17/255, green: 21/255, blue: 30/255)
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Register")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                TextField("E-mail", text: $name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white) // Cursor do texto
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    .padding(.top, 70)
                    .padding(.bottom, 20)
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white) // Cursor do texto
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    .padding(.bottom, 20)
                
                SecureField("Confirm password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(pinkColor, lineWidth: 2)
                    )
                    
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 130, height: 40)
                        .background(pinkColor)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("I already have an account")
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



struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

