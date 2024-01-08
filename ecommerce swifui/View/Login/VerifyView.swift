//
//  VerifyView.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct VerifyView: View {
    
    @StateObject var viewModel = VerifyViewModel()
    
    var phone: String
    var body: some View {
        Spacer()
            .frame(height: 30)
        VStack {
            AuthHeader(title: "Login", image: "loginImage")
                .padding(.bottom, 20)
            
            HStack{
                Text("Message sent to ")
                    .font(.customfont(.medium, fontsize: 13))
                    .frame(alignment: .trailing)
                LinkButton(title: viewModel.phone) {
                    
                }
                .frame(alignment: .leading)
                
            }
            .padding(.bottom, 20)
            
            VStack {
                OTPTextField(viewModel: viewModel)
            }
            .padding(.bottom,15)
            
            HStack{
                Text("If you don't recive message? ")
                    .font(.customfont(.medium, fontsize: 13))
                    .frame(alignment: .trailing)
                LinkButton(title: "Resent") {
                    
                }
                .frame(alignment: .leading)
                
            }
            .padding(.bottom,30)
            
            
            RoundButton(title: "Verify") {
                print("boney")
                viewModel.varifyPhone(phone: phone)
            }
//            .disabled(true)
            
            NavigationLink(
               destination: HomeView(),
               isActive: $viewModel.isVerify,
               label: { EmptyView() }
           )
           .hidden()
    
        }
        .padding()
        .onTapGesture {
            print(viewModel.checkStatus())
            // Dismiss the keyboard when tapping outside of the TextField
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
        Spacer()
    }
        
    
      
}

#Preview {
    VerifyView(phone: "249999080082")
}
