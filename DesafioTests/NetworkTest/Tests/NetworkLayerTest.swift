//
//  NetworkLayerTest.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 06/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import XCTest
@testable import Empresas_iOS_Desafio

class NetworkLayerTest: XCTestCase {
    var dataTask: URLSessionDataTaskMock!
    var provider: URLSessionProvider!
    var session: URLSessionMock!
    var netWorkError: NetworkError!
    
    override func setUp() {
        super.setUp()
        dataTask = URLSessionDataTaskMock()
        session = URLSessionMock(dataTask: dataTask)
        provider = URLSessionProvider(session: session)
        provider.request(type: ModelMock.self, service: ServiceMock.jsonResponseWith200, completion: {_ in})
        netWorkError = NetworkError.unknown
    }
    
    override func tearDown() {
        dataTask = nil
        provider = nil
        session = nil
        netWorkError = NetworkError.unknown
    }
    
    // MARK: - Check integrity of the parameters for making a request.
    
    func testCheckIfDataTaskIsCalled() {
        XCTAssertTrue(session.dataTaskCalled, "Request is not called")
    }
    
    func testCheckCorrectURL() {
        let request = URLRequest(service: ServiceMock.jsonResponseWith200)
        XCTAssertEqual(request.url, session.lastUrl)
    }
    
    func testIsHttpBodyEmpty() {
        XCTAssertTrue(session.isHttpBodyEmpty)
    }
    
    func testCheckhttpMethod() {
        let request = URLRequest(service: ServiceMock.jsonResponseWith200)
        XCTAssertEqual(request.httpMethod, session.httpMethod)
    }
    
    func testURLSessionTaskShouldResume() {
        XCTAssertTrue(dataTask.isResumeCalled, "Resume is not called")
    }
    
    // MARK: - Check all cases of Request
    func testRequestJsonResponseWith200() {
        var sucessRequest = false
        session.service = ServiceMock.jsonResponseWith200
        provider.request(type: ModelMock.self, service: ServiceMock.jsonResponseWith200) { response in
            switch response {
            case .success(_):
                sucessRequest = true
            default: break
            }
        }
        XCTAssertTrue(sucessRequest)
    }
    
    func testRequestJsonResponseWithURLParametersWith200() {
        var sucessRequest = false
        session.service = ServiceMock.jsonResponseWithURLParametersWith200
        provider.request(type: ModelMock.self, service: ServiceMock.jsonResponseWithURLParametersWith200) { response in
            switch response {
            case .success(_):
                sucessRequest = true
            default: break
            }
        }
        XCTAssertTrue(sucessRequest)
    }
    
    func testRequestErrorWith400() {
        session.service = ServiceMock.errorWith400
        provider.request(type: ModelMock.self, service: ServiceMock.errorWith400) { response in
            switch response {
            case let .failure(error):
                self.netWorkError = error
            default: break
            }
        }
        XCTAssertEqual(self.netWorkError, NetworkError.clientError(statusCode: 400, dataResponse: "\"Client error\""))
    }
    
    func testRequestErrorWith500() {
        session.service = ServiceMock.errorWith500
        provider.request(type: ModelMock.self, service: ServiceMock.errorWith500) { response in
            switch response {
            case let .failure(error):
                self.netWorkError = error
            default: break
            }
        }
        
        XCTAssertEqual(self.netWorkError, NetworkError.serverError(statusCode: 500, dataResponse: "\"Server error\""))
    }
    
    func testRequestCheckResults() {
        var sucessResult: ModelMock?
        session.service = ServiceMock.jsonResponseWithURLParametersWith200
        provider.request(type: ModelMock.self, service: ServiceMock.jsonResponseWith200) { response in
            switch response {
            case let.success(result):
                sucessResult = result
            default: break
            }
        }
        XCTAssertEqual(sucessResult?.test, "test", "Result not obtained")
    }
    
    // MARK: - Integration Test: Check results obtained after request
    func testJsonMockCheckResults() {
        var facts = [Fact]()
        session.service = ServiceMock.jsonMock
        provider.request(type: FactResult.self, service: ServiceMock.jsonMock) { response in
            switch response {
            case let.success(result):
                facts = result.result
            default: break
            }
        }
        XCTAssertEqual(facts[0].value, "Who knows what evil lurks in the hearts of men? Goddamn Chuck Norris, that's who.", "Result not obtained")
    }
}
