//
//  Slider.swift
//  ecommerce swifui
//
//  Created by amro adil on 08/01/2024.
//

import Foundation

struct Slider: Identifiable{
    let id = UUID()
    var title: String
    var description: String
    var image: String
    var tag: Int
    var link: String
    
    
    static var sampleSlider = Slider(title: "title example", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis scelerisque ipsum eu blandit. Vivamus placerat ligula in porttitor ornare. Donec tempus pretium justo. Vivamus nec nunc id ligula ullamcorper molestie et egestas tortor.", image: "slide1", tag: 0, link: "https://google.com")
    
    static var sliders: [Slider] = [
        Slider(title: "title example", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis scelerisque ipsum eu blandit. Vivamus placerat ligula in porttitor ornare. Donec tempus pretium justo. Vivamus nec nunc id ligula ullamcorper molestie et egestas tortor.", image: "slide1", tag: 0, link: "https://google.com"),
        Slider(title: "title example", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis scelerisque ipsum eu blandit. Vivamus placerat ligula in porttitor ornare. Donec tempus pretium justo. Vivamus nec nunc id ligula ullamcorper molestie et egestas tortor.", image: "slide2", tag: 1, link: "https://google.com"),
        Slider(title: "title example", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis scelerisque ipsum eu blandit. Vivamus placerat ligula in porttitor ornare. Donec tempus pretium justo. Vivamus nec nunc id ligula ullamcorper molestie et egestas tortor.", image: "slide3", tag: 2, link: "https://google.com")
    ]
}


