//
//  OTPTextField.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct OTPTextField: View {
    
    @ObservedObject var  viewModel: VerifyViewModel
    @FocusState  var activeField: OTPFiled?

    
    var body: some View {
        
        HStack (spacing: 14) {
            ForEach(0..<4, id: \.self){ index in
                VStack {
                    TextField("", text: $viewModel.otpField[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: viewModel.activeStatusForIndex(index: index))
                        .font(.customfont(.reqular, fontsize: 13))
                        .padding(.top, 15)
                        
                    Rectangle()
                        .fill(activeField == viewModel.activeStatusForIndex(index: index) ? Color.btnColor : .gray)
                        .opacity(activeField == viewModel.activeStatusForIndex(index: index) ? 1 : 0)
                        .frame(width:39, height: 1)
                        .padding(3)
                }
                .frame(width: 51, height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke( Color.borerColor )
                )
                .onChange (of: viewModel.otpField) {newValue in
                    
                    otpCondition(value: newValue)
                    
                    if viewModel.isAllFill {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }
    }
    
    
    // MARK: - condition for customer field limiting
    func otpCondition(value:[String]){
        
        // MARK: - moving to next field
        for index in 0..<3{
            if value[index].count == 1 && viewModel.activeStatusForIndex(index: index) == activeField {
                activeField = viewModel.activeStatusForIndex(index: index + 1)
            }
        }
        
        // MARK: - moving back is text is empty
        for index in 1...3 {
            if value[index].isEmpty && !value[index - 1].isEmpty{
                activeField = viewModel.activeStatusForIndex(index: index - 1)
            }
        }
        
        for index in 0..<4 {
            if value[index].count > 1 {
                viewModel.otpField[index] = String(value[index].last!)
            }
        }
        
        let allHaveValue = value.allSatisfy { $0 != "" }

        if allHaveValue {
            viewModel.isAllFill = true
        } else {
            viewModel.isAllFill = false
        }
        
    }
    
}

// MARK: - focus enum

enum OTPFiled{
    case field1
    case field2
    case field3
    case field4
}

//#Preview {
//    OTPTextField()
//}



