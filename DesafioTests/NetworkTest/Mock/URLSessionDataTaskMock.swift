//
//  URLSessionDataTaskMock.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 06/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
@testable import Desafio

final class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    
    var isResumeCalled = false
    
    func resume() {
        isResumeCalled = true
    }
}
