////
////  NetworkService.swift
////  ecommerce swifui
////
////  Created by amro adil on 05/01/2024.
////
//
//import Foundation
//
//class NetworkService{
//        
//    static let shared = NetworkService()
//        
//        private init() {}
//        
//        func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    completion(.failure(.requestFailed(error)))
//                    return
//                }
//                
//                guard let data = data else {
//                    completion(.failure(.invalidData))
//                    return
//                }
//                
//                do {
//                    let decodedData = try JSONDecoder().decode(ResponseData<T>.self, from: data)
//                    completion(.success(decodedData))
//                } catch {
//                    completion(.failure(.decodingError(error)))
//                }
//            }.resume()
//        }
//}
