//
//  LineTextField.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct LineTextField: View {
    
    @State var title: String = "title"
    @State var placeholder: String = "Placehoder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var isValid: Bool
    var errorMessage:String = ""
    @State var showErrorMessage: Bool = false
    
    var body: some View {
        Text(title)
            .font(.customfont(.bold, fontsize: 15))
        
        TextField(placeholder, text: $txt, onEditingChanged: { isEditing in
            if isEditing {
                showErrorMessage = true
            }
        })
                .padding()
                .frame( minWidth: 0, maxWidth: .infinity)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.customfont(.reqular, fontsize: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke( Color.borerColor )
                )
                
        
        if(showErrorMessage){
            Text(errorMessage)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .padding(.bottom,10)
                .foregroundColor(.red)
        }
    }
}


struct LineSecureTextField: View {
    
    @State var title: String = "title"
    @State var placeholder: String = "Placehoder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    @State var showErrorMessage: Bool = false
    
    var isValid: Bool = true
    var errorMessage: String = ""
    var body: some View {
        Text(title)
            .font(.customfont(.bold, fontsize: 15))
        
        if !isPassword {
            TextField(placeholder, text: $txt, onEditingChanged: { isEditing in
                if isEditing {
                    showErrorMessage = true
                }
            })
                    .padding()
                    .frame( minWidth: 0, maxWidth: .infinity)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.customfont(.reqular, fontsize: 18))
                    .modifier(ShowButton(isShow: $isPassword))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke( errorMessage.isEmpty ? Color.borerColor : Color.red.opacity(0.5) , lineWidth: 1)
                    )
                    
                Text(errorMessage)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .padding(.bottom,10)
                    .foregroundColor(.red)
        }else {
            SecureField(placeholder, text: $txt, onCommit: {
                showErrorMessage = true
            })
                    .padding()
                    .frame( minWidth: 0, maxWidth: .infinity)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.customfont(.reqular, fontsize: 18))
                    .modifier(ShowButton(isShow: $isPassword))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke( Color.borerColor)
                    )
            if(showErrorMessage) {
                Text(errorMessage)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .padding(.bottom,10)
                    .foregroundColor(.red)
            }
            
        }
        
    }
}

//#Preview {
//    @State  var txt: String = ""
//    LineTextField(txt: $txt)
//}
