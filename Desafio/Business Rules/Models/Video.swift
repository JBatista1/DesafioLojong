//
//  Video.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

typealias VideosDAO = [Video]

struct Video: Codable {
    let id: Int
    let name, videosDAODescription: String
    let file: String?
    let url, url2: String
    let awsURL: String
    let image: String
    let imageURL: String
    let premium, order: Int
    
    enum CodingKeys: String, CodingKey {
          case id, name
          case videosDAODescription = "description"
          case file, url, url2
          case awsURL = "aws_url"
          case image
          case imageURL = "image_url"
          case premium, order
      }
}

struct VideoImage {
    var video: Video
    var image: UIImage
}
