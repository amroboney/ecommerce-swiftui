//
//  ContentView.swift
//  ecommerce swifui
//
//  Created by amro adil on 01/01/2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @StateObject var viewModel = SIgnInViewModel()
    @State var showErrorMessage: Bool = false
    @FocusState private var phoneIsFocused: Bool
    
    var body: some View {
        
        
        VStack {

            AuthHeader(title: "Login", image: "loginImage")
            
            VStack(alignment: .leading) {
                Text("Phone Number")
                    .font(.customfont(.reqular, fontsize: 13))
                
                HStack{
                    
                    Button{
                        viewModel.isShowCountryPicker = true
                    } label: {
                        if let countryObj = viewModel.countryObj {
                            Text("\(countryObj.isoCode.getFlag())")
                                .font(.customfont(.reqular, fontsize: 30))
                                .padding(.leading)
                            
                            Text("+ \(countryObj.phoneCode)")
                                .font(.customfont(.reqular, fontsize: 18))
                                .foregroundColor(.primary)
                        }
                    }
                        .frame(height: 48)
                    
                    
                    TextField("Enter your Phone Number", text: $viewModel.phone, onEditingChanged: { isEditing in
                        if isEditing {
                            showErrorMessage = true
                        }
                    })
                        .padding()
                        .frame( minWidth: 0, maxWidth: .infinity)
                        .keyboardType(.numberPad)
                        .font(.customfont(.reqular, fontsize: 18))
                        .focused($phoneIsFocused)

                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.borerColor, lineWidth: 1)
                )
                
                if showErrorMessage {
                    Text(viewModel.phonePrompet)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.caption)
                        .padding(.bottom,10)
                        .foregroundColor(.red)
                }
                
            }
            .padding(.top, 30)
            
            Divider()
                .padding(.bottom, 10)
        
            
//            NavigationLink(destination: VerifyView(phone: viewModel.phone), isActive: $viewModel.isLogin) {
            RoundButton(title: "Login", isLoading: viewModel.isLoading) {
                    viewModel.validateLogin()
//                    viewModel.isLogin = true
                }
                
//            }
            
            NavigationLink(
               destination: VerifyView(phone: viewModel.fullPhone),
               isActive: $viewModel.isLogin,
               label: { EmptyView() }
           )
           .hidden()
            
        }
        .onAppear{
            viewModel.countryObj = Country(phoneCode: "249", isoCode: "SD")
        }
        .sheet(isPresented: $viewModel.isShowCountryPicker, content: {
            CountryPickerUI( country: $viewModel.countryObj)
        })
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done"){
                    phoneIsFocused = false
                }
                
            }
        }
        .onTapGesture {
            hideKeynoard()
        }
        
        .padding()
        .padding(.top, 50)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        

        Spacer()
        
        
    }
}

#Preview {
    NavigationView{
        SignInView()
        Spacer()
    }
    
    
}
