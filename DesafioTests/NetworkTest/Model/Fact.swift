//
//  Fact.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
struct Fact: Codable {
    var value: String
    var categories: [String]
    
    init(value: String, categories: [String]) {
        self.value = value
        self.categories = categories
    }
}
