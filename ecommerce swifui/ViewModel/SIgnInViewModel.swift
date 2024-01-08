//
//  SIgnInViewModel.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import Foundation
import CountryPicker


class SIgnInViewModel: ObservableObject {
    
    @Published var phone: String = "999080082"
    @Published var fullPhone: String = ""
    @Published var countryObj: Country?
    @Published var isLogin = false
    @Published var isShowCountryPicker = false
    @Published var items: [Category]?
    @Published var isLoading:Bool =  false
    @Published var category: [Category] = []
    @Published var alertItem: AlertItem?
    
    
    func validateLogin() {
        
        isLoading = true
        fullPhone = countryObj!.phoneCode + phone
        let params = [
            "phone": fullPhone
        ]
        NetworkManeger.shared.fetchSingin(parameters: params as [String : Any]) {  [weak self] (result) in
            self?.isLoading = false
            switch result {
                
            case .success(let data):
                print("bon")
                self?.isLogin = true
                print(self?.isLogin)
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    func isValidePhone(phone: String) ->Bool {
        if phone.count != 9 {
            return false
        }
        return true
    }
    
    var phonePrompet: String {
        if isValidePhone(phone: phone) {
            return ""
        }else {
            return "The phone must be 9 digits"
        }
    }
    
    
    func getProducts() {
        print("function called")
//            isLoading = true
        
        
//        NetworkManeger.shared.fetchCategories { Result<[Category], Error> in
//            <#code#>
//        }
        
        NetworkManeger.shared.fetchCategories {  (result) in
            switch result {
                
            case .success(let category):
                print(category)
                
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
