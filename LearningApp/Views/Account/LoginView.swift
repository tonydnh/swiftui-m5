//
//  LoginView.swift
//  LearningApp
//
//  Created by Tony Dinh on 7/9/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var loginMode = Constants.LoginMode.login
    @State var email = ""
    @State var name = ""
    @State var password = ""
    
    var buttonText: String {
        if loginMode == Constants.LoginMode.login {
            return "Login"
        }
        else {
            return "Sign up"
        }
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            // Logo
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150)
            
            // Title
            Text("Learnzilla")
            
            Spacer()
            
            // Picker
            Picker("", selection: $loginMode) {
                Text("Login")
                    .tag(Constants.LoginMode.login)
                
                Text("Sign Up")
                    .tag(Constants.LoginMode.createAccount)
            }
            .pickerStyle(.segmented)
            
            // Form
            TextField("Email", text: $email)
            
            if loginMode == Constants.LoginMode.createAccount {
                TextField("Name", text: $name)
            }
            
            SecureField("Password", text: $password)
            
            // Button
            Button {
                if loginMode == Constants.LoginMode.login {
                    // Log the user in
                }
                else {
                    // Create a new account
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 40)
                        .cornerRadius(10)
                    
                    Text(buttonText)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()

        }
        .padding(.horizontal, 40)
        .textFieldStyle(.roundedBorder)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
