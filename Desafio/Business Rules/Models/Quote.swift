//
//  Quotes.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation

struct QuoteDAO {
    let quites: [Quote]
}
struct Quote {
    var id: String
    var text: String
}
struct QuoteAuthor {
    var quote: Quote
    var author: String
}
