//
//  ecommerce_swifuiApp.swift
//  ecommerce swifui
//
//  Created by amro adil on 01/01/2024.
//

import SwiftUI
import IQKeyboardManagerSwift

// MARK: Add from here
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        IQKeyboardManager.shared.enable = true
//        return true
//    }
//}


@main
struct ecommerce_swifuiApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // add this line in the struct
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                
                
//                    HomeView()
//                        .toolbar {
//                            ToolbarItemGroup(placement: .navigationBarTrailing) {
//                                Button {
//                                    SecureStorage.shared.removeToken()
//                                } label: {
//                                    Image(systemName:  "rectangle.portrait.and.arrow.right")
//                                }
//
//                            }
//                        }
                
                    SignInView()
                
                Spacer()
                    
            })
            
        }
    }
}
