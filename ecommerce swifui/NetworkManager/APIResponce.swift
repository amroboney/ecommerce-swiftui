//
//  ResponseData.swift
//  ecommerce swifui
//
//  Created by amro adil on 05/01/2024.
//

import Foundation

struct ApiResponse: Decodable {
    let status: String?
    let message: String?
    let data: [Category]?
}


import Foundation

struct ApiResponse <T: Decodable> : Decodable {
    let status: String?
    let message: String?
    let data: T?
    let errors: T?
}
