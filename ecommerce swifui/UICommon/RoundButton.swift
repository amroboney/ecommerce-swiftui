//
//  RoundButton.swift
//  ecommerce swifui
//
//  Created by amro adil on 01/01/2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "title"
    @State var isLoading: Bool = false
    var action: (()->())?
    
    var body: some View {
        Button {
            action?()
        } label: {
            
            if isLoading {
                HStack{
                    ProgressView()
                        .tint(.white)
                        .padding(5)
                    Text("Loading ...")
                    
                }
                .padding()
                .frame(maxWidth: .infinity , minHeight:44, maxHeight: 44)
                .background(Color.btnColor)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .cornerRadius(10)
            }else{
                Text(title)
                    .padding()
                    .frame(maxWidth: .infinity , minHeight:44, maxHeight: 44)
                    .background(Color.btnColor)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .cornerRadius(10)
            }
            
        }
    }
}

#Preview {
    RoundButton()
        .padding()
}
