//
//  SliderViewModel.swift
//  ecommerce swifui
//
//  Created by amro adil on 08/01/2024.
//

import SwiftUI

class SliderViewModel: ObservableObject{
    
    @Published var slider: Slider = Slider.sampleSlider
    @Published var sliders: [Slider] = Slider.sliders
    @Published var pageIndex = 0
    @Published var dotAppearance = UIPageControl.appearance()
    
    
//    init() {
//      UIPageControl.appearance().currentPageIndicatorTintColor = .purple
//      UIPageControl.appearance().pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.2)
//        UIPageControl.appearance().transform = CGAffineTransform(scaleX: 1.5, y: 1.2)
//    }
    
    let timerInterval = 5.0
    let totalTabs = 3
    func changeSlider() {
        pageIndex += 1
    }
    
}
