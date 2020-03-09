//
//  Quotes.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation

typealias QuoteDAO = [Quote]

struct Quote: Codable {
    let id: Int
    let text: String
    let order: Int
}
