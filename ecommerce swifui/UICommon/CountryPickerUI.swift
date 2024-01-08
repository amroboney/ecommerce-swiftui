//
//  CountryPickerUI.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {
   
    @Binding var country: Country?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "SDN"
        countryPicker.delegate = context.coordinator
        return countryPicker

    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

}

class Coordinator: NSObject, CountryPickerDelegate {
    
    var parent: CountryPickerUI
    
    init(parent: CountryPickerUI) {
        self.parent = parent
    }
    
    
    func countryPicker(didSelect country: Country) {
        DispatchQueue.main.async {
            self.parent.country = country
        }
    }

}



