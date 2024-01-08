//
//  APError.swift
//  E-commerce
//
//  Created by amro adil on 06/10/2023.
//

import Foundation

enum AppError: LocalizedError, Error{
    case errorDecoding
    case unknowError
    case invalideError
    case serverError(String)
    case invalidOtp
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknowError:
            return "unkown what is happened"
        case .invalideError:
            return "The URL is invalid"
        case .serverError(let string):
            return string
        case .invalidOtp:
            return "the otp is not correct"
        }
    }
}
