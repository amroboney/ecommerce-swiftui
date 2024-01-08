//
//  slider.swift
//  ecommerce swifui
//
//  Created by amro adil on 08/01/2024.
//

import SwiftUI

struct SliderView: View {
    
    @State var slider: Slider = Slider.sampleSlider
    
    var body: some View {
        
        ZStack (alignment: .bottomTrailing) {
            Image(slider.image)
                .resizable()
                .scaledToFill()
                .frame(width: 343, height: 165)
                .cornerRadius(20)
            
            Text(slider.title)
                .foregroundStyle(Color(.white))
                .font(.customfont(.bold, fontsize: 20))
                .padding()
        }
    }
}

#Preview {
//    var slider = Slider.sampleSlider
    SliderView()
}
