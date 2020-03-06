//
//  ImageSteps.swift
//  Desafio
//
//  Created by Joao Batista on 06/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

enum ImageSteps {
    case playStepGrassVertical
    case playStepGrassHorizontal
    case playStepRiverVertical
    case playStepRiverHorizontal
    
    case reviewStepGrassVertical
    case reviewStepGrassHotizontal
    case reviewStepRiverVertical
    case reviewStepRiverHorizontal
   
    var image : UIImage {
        switch self {
        case .playStepGrassVertical:
            return UIImage()
            
        default:
            return UIImage()
        }
    }
    
}
