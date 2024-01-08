//
//  sliderListView.swift
//  ecommerce swifui
//
//  Created by amro adil on 08/01/2024.
//

import SwiftUI

struct sliderListView: View {
    
    @StateObject var viewModel = SliderViewModel()
    
    var body: some View {
        
        
        TabView (selection: $viewModel.pageIndex){
            ForEach(viewModel.sliders){ slider in
                SliderView(slider: slider)
                    .tag(slider.tag)
            }
        }
        .frame(height: 250)
        .animation(.easeInOut, value: viewModel.pageIndex)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            viewModel.dotAppearance.currentPageIndicatorTintColor = .black
            viewModel.dotAppearance.pageIndicatorTintColor = .gray
            
            Timer.scheduledTimer(withTimeInterval: viewModel.timerInterval, repeats: true) { _ in
                withAnimation {
                    viewModel.pageIndex = (viewModel.pageIndex + 1) % viewModel.totalTabs
                }
            }
        }
        
    }
}

#Preview {
    sliderListView()
}
