//
//  NetworkError.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 04/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
  case unknown
  case clientError(statusCode: Int, dataResponse: String)
  case serverError(statusCode: Int, dataResponse: String)
  case decodeError(String)
  case noJSONData
}
