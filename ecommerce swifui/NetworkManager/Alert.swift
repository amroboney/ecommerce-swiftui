//
//  Alert.swift
//  E-commerce
//
//  Created by amro adil on 09/10/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("there was an issue connecting to the server. if this persists, please contact support"),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                      message: Text("Invalid response from the server, please connect again latter or contact support"),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                      message: Text("The data recived from the server was invalid, please contact support"),
                                      dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                      message: Text("Unable to complete your request at this time. please check your internet connection"),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidOtp = AlertItem(title: Text("Data Mismatch"),
                                      message: Text("Please enter the valid OTP"),
                                      dismissButton: .default(Text("Ok")))
}
