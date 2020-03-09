//
//  Article.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

struct ArticleDAO: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let id: Int
    let text, title: String
    let imageURL: String
    let authorName: String
    let url: String
    let premium, order: Int
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id, text, title
        case imageURL = "image_url"
        case authorName = "author_name"
        case url, premium, order, image
    }
}
struct ArticleImage {
    var article: Article
    var image: UIImage
}
