//
//  HTTPTask.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 04/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum HTTPTask {
    case requestPlain
    case requestParameters(Parameters)
}
