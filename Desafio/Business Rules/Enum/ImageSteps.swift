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
    case elephantGrass
    
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
        case .elephantGrass:
            return UIImage(named: "elephantGrass")!
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
        case .elephantGrass:
            return UIImage(named: "elephantRiver")!
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
            return CGSize(width: 146, height: 150)
        case .elephantGrass:
            return CGSize(width: 82, height: 65)
        }
    }
    
}
