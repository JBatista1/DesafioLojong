//
//  ServiceMock.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 06/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
@testable import Desafio

enum ServiceMock: ServiceProtocol {
    case jsonResponseWith200
    case jsonResponseWithURLParametersWith200
    case errorWith400
    case errorWith500
    case jsonMock
    
    var baseURL: URL {
        let url = "https://google.com/"
        return URL(string: url) ?? URL(fileURLWithPath: "")
    }
    
    var path: String {
        return "api"
    }
    
    var method: HTTPMethod {
        switch self {
        case .jsonResponseWith200:
            return .get
        case .jsonResponseWithURLParametersWith200:
             return .get
        default:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .jsonResponseWith200:
            return .requestPlain
        default:
            let parameters = ["test": "test"]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return[:]
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .jsonResponseWith200:
            return .json
        default:
            return .url
        }
    }
}
