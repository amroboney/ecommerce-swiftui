//
//  VerifyViewModel.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI
import KeychainAccess

class VerifyViewModel: ObservableObject {
    
    @Published var otpText: String = ""
    @Published var otpField: [String] = Array(repeating: "", count: 4)
    @Published var phone: String = "+249999080082"
    @Published var isAllFill: Bool = false
    @Published var isVerify: Bool = false
    @Published var isLoading: Bool = true
    @Published var alertItem: AlertItem?
//    @Published var activeField: OTPFiled?
   
    
    func varifyPhone(phone: String) {
        
        isLoading = true
        
        let params = [
            "phone": phone,
            "otp": getOtp()
        ]
        NetworkManeger.shared.fetchVerify(parameters: params as [String : Any]) {  [weak self] (result) in
            
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                    
                case .success(let data):
                    print(data.token)
//                    SecureStorage.shared.saveToken(token: data.token!)
                    
                    
                    print(data)
                    print("otp verifyed")
                    self?.isVerify = true
                    //                if data.status = 100 {
                    //
                    //                }
                    
                    
                case .failure(let error):
                    
                    switch error {
                    case AppError.invalidOtp:
                        print("boney invalid otp")
                        self?.alertItem = AlertContext.invalidOtp
                    default:
                        print("system Error")
                    }
                    
                    print("error in fetsh verify view model")
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func getOtp() -> String{
        var otp = ""
        for i in otpField {
            otp = otp + i
        }
        return otp
    }
    
    
    // MARK: - check the all textfield is not empty
    func checkStatus ()-> Bool {
        for index in 0..<3 {
            if otpField[index].isEmpty{ return true}
        }
        return false
    }
    
    
    
    func activeStatusForIndex(index: Int)-> OTPFiled {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        default: return .field4
        }
    }
    
    // MARK: - save the data on keychain
    
    private func saveUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let userData = try encoder.encode(user)

            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: "userObject",
                kSecValueData as String: userData
            ]

            let status = SecItemAdd(query as CFDictionary, nil)

            if status == errSecSuccess {
                print("User saved successfully")
            } else {
                print("Failed to save user with status \(status)")
            }
        } catch {
            print("Error encoding user: \(error)")
        }
    }
    
}



