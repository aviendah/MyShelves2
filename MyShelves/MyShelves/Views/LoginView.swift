//
//  LoginView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                // icon
                Image("ShelfSet")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .padding(.vertical, 32)
            }
            
            
            // email & password
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // button
            Button(action: {
                
                Task {
                    try await authVM.signIn(withEmail: email, password: password)
                    
                }
                
            }, label: {
                HStack {
                    Text("Sign In")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(Color(.white))
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            })
            .background(Color(.systemBrown))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            // sign up
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 2) {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 20))
                .foregroundColor(Color(.darkGray))
            }
        }
    }
    
}

#Preview {
    LoginView()
}
