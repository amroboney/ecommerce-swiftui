//
//  ResponseData.swift
//  ecommerce swifui
//
//  Created by amro adil on 05/01/2024.
//

import Foundation

struct APIResponce: Decodable {
    let status: String?
    let message: String?
    let data: [Category]?
}


