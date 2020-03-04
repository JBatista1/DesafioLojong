//
//  NetworkResponse.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 04/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

enum NetworkResponse<T> {
  case success(T)
  case failure(NetworkError)
}
