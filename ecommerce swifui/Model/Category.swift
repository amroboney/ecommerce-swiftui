//
//  Category.swift
//  ecommerce swifui
//
//  Created by amro adil on 05/01/2024.
//

import Foundation


struct Category: Decodable {
    
    let id: String
    let name: String
    let parent_id: String
    let categories_image: String
    let status: String
    let parentname: String
    
}
