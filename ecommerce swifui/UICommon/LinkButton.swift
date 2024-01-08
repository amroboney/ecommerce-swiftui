//
//  LinkButton.swift
//  ecommerce swifui
//
//  Created by amro adil on 03/01/2024.
//

import SwiftUI

struct LinkButton: View {
    @State var title: String = "Title"
    var action: (() ->())?
    var body: some View {
        
        Button {
            action?()
        }label: {
            Text(title)
                .font(.customfont(.bold, fontsize: 13))
                .foregroundColor(.linkColor)
        }
        
    }
}

#Preview {
    LinkButton()
}
