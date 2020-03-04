//
//  URLSessionProvider.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

final class URLSessionProvider: ProviderProtocol {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        let request = URLRequest(service: service)
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (NetworkResponse<T>) -> Void) {
        guard error == nil else {  return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData))}
        
        guard let result = data else {
            return completion(.failure(.unknown))
        }
        
        guard let dataString = String(bytes: result, encoding: .utf8) else { return  }
        
        switch response.statusCode {
        case 200...299:
            if let model = try? JSONDecoder().decode(T.self, from: result) {
                completion(.success(model))
            }
        case 400...499:
            completion(.failure(NetworkError.clientError(statusCode: response.statusCode, dataResponse: dataString)))
        case 500...599:
             completion(.failure(NetworkError.serverError(statusCode: response.statusCode, dataResponse: dataString)))
        default:
           
            completion(.failure(.unknown))
        }
    }
    
}
