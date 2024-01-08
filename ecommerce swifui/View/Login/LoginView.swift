//
//  LoginView.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct LoginView: View {
    
//    @StateObject var viewModel = LoginViewModel.shared
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        VStack{
            
            AuthHeader(title: "Login", image: "loginImage")            
            
            VStack(alignment: .leading) {
                
                LineTextField(title: "Email", placeholder: "Enter Your Email", txt: $viewModel.email, keyboardType: .emailAddress, isPassword: false, isValid: viewModel.isEmailValid, errorMessage: viewModel.emailPrompet)
               
                
                LineSecureTextField(title: "Password", placeholder: "Enter Your Password", txt: $viewModel.password, keyboardType: .default, isPassword: true, isValid: viewModel.isPasswordValid, errorMessage: viewModel.passworfPrompet)
                
                
                LinkButton(title: "Forgot password?") {
                    
                }
                
                

            }
            .padding(.vertical, 20)
            
            
            RoundButton(title: "Login") {
                viewModel.checkValidation()
                
                print(viewModel.isPasswordValid)
            }
            
            Spacer()
            
            HStack{
                Text("Don't have an account? ")
                    .font(.customfont(.medium, fontsize: 13))
                    .frame(alignment: .trailing)
                LinkButton(title: "Create account now") {
                    
                }
                .frame(alignment: .leading)
                
            }
        }
        
        .padding()
        .padding(.top, 30)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    LoginView()
}
