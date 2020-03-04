//
//  NetworkService.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

// MARK: Exemplo de networkService

import Foundation

enum NetworkService<T: Codable>: ServiceProtocol {
    case getTextSearch(T.Type, String)
    
    var baseURL: URL {
        let url = "https://api.chucknorris.io/jokes"
        return URL(string: url) ?? URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .getTextSearch:
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTextSearch:
            return .get
        }
    }
        var task: HTTPTask {
            switch self {
            case .getTextSearch(_, let text):
                return .requestParameters(["query": text])
            }
        }
        
        var headers: Headers? {
            return nil
        }
        
        var parametersEncoding: ParametersEncoding {
            switch self {
            case .getTextSearch:
                return .url
            }
        }
        
}
