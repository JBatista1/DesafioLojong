//
//  URLSessionMock.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 06/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
@testable import Empresas_iOS_Desafio

final class URLSessionMock: URLSessionProtocol {
    private(set) var dataTaskCalled = false
    private(set) var lastUrl: URL?
    private(set) var path: String?
    private(set) var isHttpBodyEmpty = true
    private(set) var httpMethod = String()
    
    var service: ServiceMock!
    private let dataTask: URLSessionDataTaskProtocol
    
    init(dataTask: URLSessionDataTaskProtocol) {
        self.dataTask = dataTask
    }
    
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let model = ModelMock(test: "test")
        setupValuesForTest(request: request)
        switch service {
        case .jsonResponseWith200:
            createCompletionHandler(completionHandler: completionHandler, code: 200, data: model)
        case .jsonResponseWithURLParametersWith200:
            createCompletionHandler(completionHandler: completionHandler, code: 200, data: model)
        case .errorWith400:
            createCompletionHandler(completionHandler: completionHandler, code: 400, data: "Client error")
        case .errorWith500:
            createCompletionHandler(completionHandler: completionHandler, code: 500, data: "Server error")
        case .jsonMock :
            let response = HTTPURLResponse(url: service.baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
                   completionHandler(loadJsonFact(), response, nil)
        default:
            ()
        }
        return dataTask
    }
    
    private func createCompletionHandler<T>(completionHandler: URLSessionMock.DataTaskResult, code: Int, data: T) where T: Encodable {
        let data = try?JSONEncoder().encode(data)
        let response = HTTPURLResponse(url: service.baseURL, statusCode: code, httpVersion: nil, headerFields: nil)
        completionHandler(data, response, nil)
    }
    
    func setupValuesForTest(request: URLRequest) {
        dataTaskCalled = true
        lastUrl = request.url
        isHttpBodyEmpty = request.httpBody == nil
        httpMethod = request.httpMethod!
    }
    func loadJsonFact() -> Data? {
        var data = Data()
        if let path = Bundle.main.path(forResource: "Facts", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return data
    }
}
