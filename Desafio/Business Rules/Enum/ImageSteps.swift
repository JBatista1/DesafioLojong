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
    
    var image: UIImage {
        switch self {
        case .playStepGrassVertical:
            return UIImage(named: "playStepGrassVertical")!
        case .playStepGrassHorizontal:
            return UIImage(named: "playStepGrassHorizontal")!
        case .playStepRiverVertical:
            return UIImage(named: "playStepRiverVertical")!
        case .playStepRiverHorizontal:
            return UIImage(named: "playStepRiverHorizontal")!
    
        }
    }
    var reviewImage: UIImage {
        switch self {
        case .playStepGrassVertical:
            return UIImage(named: "reviewStepGrassVertical")!
        case .playStepGrassHorizontal:
            return UIImage(named: "reviewStepGrassHotizontal")!
        case .playStepRiverVertical:
            return UIImage(named: "reviewStepRiverVertical")!
        case .playStepRiverHorizontal:
            return UIImage(named: "reviewStepRiverHorizontal")!
        }
    }
    
    var size: CGSize {
        switch self {
        case .playStepGrassVertical:
            return CGSize(width: 130, height: 138)
        case .playStepGrassHorizontal:
            return CGSize(width: 133, height: 129)
        case .playStepRiverVertical:
            return CGSize(width: 146, height: 146)
        case .playStepRiverHorizontal:
            return CGSize(width: 143, height: 148)
            
        }
    }
    
}
