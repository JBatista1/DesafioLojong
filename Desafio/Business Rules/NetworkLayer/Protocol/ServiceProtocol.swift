//
//  ServiceProtocol.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 04/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

public typealias Headers = [String: String]

protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
