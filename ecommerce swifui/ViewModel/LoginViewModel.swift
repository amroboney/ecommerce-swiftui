//
//  LoginViewModel.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
//    static var shared: LoginViewModel = LoginViewModel()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    
    func checkValidation(){

        isEmailValid = validateEmail(email)
        isPasswordValid = validatePassword(password)
 
        if  isEmailValid && isPasswordValid  {
            print("Updating user: \(email)")
        }else{
            print("validation error")
        }
    }
    
    
    private func validateEmail(_ email: String) -> Bool {
        
        if email.isEmpty {
            return false
        }else{
            if !email.isValidEmail() {
                return false
            }
        }
        
        return true
    }
    
    
    private func validatePassword(_ password: String) -> Bool {
        if password.isEmpty {
            return false
        }
        
        return true
    }
    
    var emailPrompet: String {
        if email.isValidEmail() {
//            isEmailValid = true
            return ""
        }else {
//            isEmailValid = false
            return "Please enter valid email address"
        }
    }
    
    
    var passworfPrompet: String {
        
    
        if password.isValidPassword() {
//            isPasswordValid = true
            return ""
        }else {
//            isPasswordValid = false
            return "Password Minimum 8 characters at least 1 Alphabet and 1 Number"
        }
    }
}
