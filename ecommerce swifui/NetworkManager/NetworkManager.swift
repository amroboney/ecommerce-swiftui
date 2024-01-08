//
//  NetworkManager.swift
//  ecommerce swifui
//
//  Created by amro adil on 05/01/2024.
//

import Foundation

struct NetworkManeger{
    
    static let shared = NetworkManeger()
    var alertItem: AlertItem?
    private init(){}
    
    func fetchCategories(completion: @escaping (Result<[Category],Error>)-> Void) {
        request(route: .categories, method: .get, completion: completion)
    }
    
    func fetchSingin(parameters: [String: Any]?,completion: @escaping (Result<User,Error>)-> Void) {
        let parms = parameters
        
        request(route: .login, method: .post,parameters: parms, completion: completion)
    }
    
    func fetchVerify(parameters: [String: Any]?,completion: @escaping (Result<User,Error>)-> Void) {
        let parms = parameters
        
        request(route: .verify, method: .post,parameters: parms, completion: completion)
    }
    
    
    private func request<T: Decodable>(route: Route, method: Method, parameters: [String: Any]? = nil, completion:@escaping (Result<T, Error>) -> Void) {
            
            guard let request = createRequest(route: route, method: method, parameters: parameters) else {
                completion(.failure(AppError.unknowError))
                return
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                var result: Result<Data, Error>?
                
                if let data = data {
                    result = .success(data)
                    let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data"
                    print("boney1")
                    print(responseString)
                }else if let error = error {
                    result = .failure(error)
                    print("the error is \(error)")
                }
                DispatchQueue.main.async {
                    self.handleResponse(result: result, completion: completion)
                }
            }.resume()
            
        }
    
    private func handleResponse<T: Decodable>(result: Result<Data,Error>?, completion: (Result<T, Error>) -> Void) {
            guard let result = result else {
                completion(.failure(AppError.unknowError))
                return
            }
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                
                guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
//                guard let response = try? decoder.decode(T.self, from: data) else {
                    completion(.failure(AppError.errorDecoding))
                    return
                }
                
                
                if let error = response.errors {
                    completion(.failure(AppError.serverError(error as! String)))
                    return
                }
                
                print("----------------")
                print(response)
                print("----------------")
                
                if  response.responseCode == 102 {
//                    completion(.success(response as! T))
                    completion(.failure(AppError.invalidOtp))
                }
                
                if let decodedData = response.data {
                    completion(.success(decodedData))
                }else {
                    print(response.data)
                    print("boney")
                    completion(.failure(AppError.unknowError))
                }
                        
            case .failure(let error):
                completion(.failure(error))
            }
        }
    
    
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest?{
        // generate the base url for the request
        let urlString = Route.baseUrl + route.descripiton
        print(urlString)
        // check the url and convert to url request
        guard let url = URL(string: urlString) else { return nil }
        // create the urlrequest
        var urlRequest = URLRequest(url: url)
        // the the header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // add the method
        urlRequest.httpMethod = method.rawValue
        // add the paramerters
        if let parms = parameters {
            switch method{
            case .get, .delete:
                // send the data on the base url
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parms.map({ (key: String, value: Any) in
                    URLQueryItem(name: key, value: "\(value)")
                })
                urlRequest.url = urlComponent?.url
                
            case .post, .put, .patch:
                // send the data on body
                let bodyData = try? JSONSerialization.data(withJSONObject: parms, options: [])
                urlRequest.httpBody = bodyData
                        
            }
        }
        return urlRequest
        }

}

