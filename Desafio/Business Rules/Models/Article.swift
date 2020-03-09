//
//  Article.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
struct Article {
    var id: String
    var text: String
    var title: String
    var image_url: String
}
struct ArticleImage {
    var article: Article
    var image: UIImage
}
