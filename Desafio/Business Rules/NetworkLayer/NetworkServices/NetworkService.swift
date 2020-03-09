//
//  NetworkService.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

// MARK: Exemplo de networkService

import Foundation

enum NetworkService: ServiceProtocol {
    
    case getVideos
    case getArticle
    case getQuote
    var baseURL: URL {
        let url = "https://devlojong.com/api"
        return URL(string: url) ?? URL(fileURLWithPath: "")
    }

    var path: String {
        switch self {
        case .getVideos:
            return "/videos"
        case .getArticle:
            return "/articles"
        case .getQuote:
            return "/quotes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getVideos, .getArticle, .getQuote:
            return .get
        }
    }
    var task: HTTPTask {
        switch self {
        case .getVideos, .getArticle, .getQuote:
            return .requestPlain
        }
    }
    
    var headers: Headers? {
        switch self {
        case .getVideos, .getArticle:
            var header: [String: String] = ["Authorization": "Bearer test"]
            header["Accept"] = "application/json"
            return header
        case .getQuote:
            var header: [String: String] = ["Authorization": "Bearer test"]
            header["Content-Type"] = "application/x-www-form-urlencoded"
            return header
            
        }
        
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .getVideos, .getArticle, .getQuote:
            return .json
        }
    }
    
}
