//
//  Route.swift
//  ecommerce swifui
//
//  Created by amro adil on 06/01/2024.
//

import Foundation

enum Route {

    static let baseUrl = "http://localhost:8000/api"
    //static let baseUrl = "https://api.dawakmedical.com/api"
    case product
    case findProduct(String)
    case popular
    case categories
    case newProduct
    case productByCatrgory(String)
    case login
    case verify
    
    var descripiton: String {
        switch self {
        case .login:
            return "/login"
        case .verify:
            return "/verify"
        case .product:
            return "/product"
        case .findProduct(let productId):
            return "/product/\(productId)"
        case .popular:
            return "/popularProducts"
        case .categories:
            return "/mainCategories"
        case .newProduct:
            return "/newestProducts"
        case .productByCatrgory(let categoryId):
            return "/productByCategory/\(categoryId)"
        }
    }
    
}

