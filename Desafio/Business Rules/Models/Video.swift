//
//  Video.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

struct VideoDAO {
    var videos: [Video]
}

struct Video {
    var id: String
    var name: String
    var description: String
    var image_url: String
    var aws_url: String
}

struct VideoImage {
    var video: Video
    var image: UIImage
}
