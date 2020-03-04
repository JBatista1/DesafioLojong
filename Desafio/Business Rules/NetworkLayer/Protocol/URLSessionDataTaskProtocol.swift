//
//  URLSessionDataTaskProtocol.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol: class {
    func resume()
}
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
