//
//  URLRequest.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 04/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

extension URLRequest {

    init(service: ServiceProtocol) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!)
        httpMethod = service.method.rawValue
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }

        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .json else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
