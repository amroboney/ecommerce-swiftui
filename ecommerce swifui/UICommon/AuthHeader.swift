//
//  AuthHeader.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct AuthHeader: View {
    
    @State var title: String = "title"
    @State var image:String = "loginImage"
    
    var body: some View {
        
        Text(title)
             .font(.customfont(.semibold, fontsize: 30))
         
         Image(image)
             .resizable()
             .frame(width: 188, height: 188)
             .padding(.top, 30)
        
    }
}

#Preview {
    AuthHeader()
}
