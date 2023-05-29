//
//  SignUpView.swift
//  Firabase_SwiftUI
//
//  Created by Arturo Burigo on 5/22/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image("parkeasename")
            
            
            VStack{
                InputView(text: $email, systemIcon: "envelope",
                          placeHolder: "abc@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullname, systemIcon: "person",
                          placeHolder: "Your Full name")
                
                InputView(text: $password, systemIcon: "key.horizontal",placeHolder: "Enter your password", isSecureField: true)
                
                ZStack (alignment: .trailing) {
                    InputView(text: $confirmPassword, systemIcon: "key.horizontal",
                              placeHolder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .padding(.horizontal)
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        }
                    }
                    
                    }
                }
                
            .padding(.horizontal)
            .padding(.top, 24)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail:email,
                                                   password:password,
                                                   fullname: fullname)
                }
            } label: {
                HStack{
                    Text("Sign Up")
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
                .background(Color("mainColor"))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Log in")
                        .fontWeight(.bold)
                }
                    .padding(.bottom, 30)
                    .foregroundColor(Color("mainColor"))
            }


        }
    }
}

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !fullname.isEmpty
        && !password.isEmpty
        && confirmPassword == password
        && password.count > 5
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
