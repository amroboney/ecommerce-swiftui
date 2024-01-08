//
//  SecureStorage.swift
//  ecommerce swifui
//
//  Created by amro adil on 07/01/2024.
//

import Foundation
import KeychainAccess

final class SecureStorage{
    private let keyName = "userToken"
    static let shared = SecureStorage()
    
    let keychain = Keychain(service: "com.amroboney.ecommerce-swifui")
    
    func saveToken(token: String) {
        do {
            try keychain.set(token, key: keyName)
        }
        catch let error {
            print(error)
        }
    }
    
    func getToken() -> String {
        let token = try? keychain.get(keyName)
        return token!
    }
    
    
    func removeToken() {
        print("remover token")
        do {
            try keychain.remove(keyName)
        } catch let error {
            print("error: \(error)")
        }
    }
    
    
}
