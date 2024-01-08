//
//  ResponseData.swift
//  ecommerce swifui
//
//  Created by amro adil on 05/01/2024.
//

import Foundation

struct ApiResponse <T: Decodable> : Decodable {
    let responseCode: Int?
    let responseMessage: String?
    let responseDescription: String?
    let data: T?
    let errors: T?
}

//enum CodingKeys: String, CodingKey{
//    case code = "responseCode"
//    case message = "responseMessage"
//    case description = "responseDescription"
//    case data
//    case errors
//}


