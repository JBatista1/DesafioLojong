//
//  StepsMockData.swift
//  Desafio
//
//  Created by Joao Batista on 06/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit
typealias PositionsElephant = (CGPoint, Int)

class StepsMockData {
    private let positions: [CGPoint]
    private let elephantPositions: [ElephantSteps]
    private let imagesSteps: [ImageSteps]
    private var steps: [StepsRoute]
    
    init() {
        steps = []
        
        positions = [ CGPoint(x: 378, y: 7140),
                      CGPoint(x: 378, y: 6950),
                      CGPoint(x: 229, y: 6805),
                      CGPoint(x: 62, y: 6653),
                      CGPoint(x: 254, y: 6509),
                      CGPoint(x: 458, y: 6353),
                      CGPoint(x: 307, y: 6204),
                      CGPoint(x: 149, y: 6033),
                      CGPoint(x: 149, y: 5863),
                      CGPoint(x: 149, y: 5693),
                      CGPoint(x: 272, y: 5514),
                      CGPoint(x: 405, y: 5327),
                      CGPoint(x: 117, y: 4799),
                      CGPoint(x: 117, y: 4583),
                      CGPoint(x: 326, y: 4282),
                      CGPoint(x: 49, y: 4002),
                      CGPoint(x: 49, y: 3792),
                      CGPoint(x: 211, y: 3619),
                      CGPoint(x: 358, y: 3483),
                      CGPoint(x: 358, y: 3314),
                      CGPoint(x: 358, y: 3145),
                      CGPoint(x: 149, y: 2869),
                      CGPoint(x: 426, y: 2603),
                      CGPoint(x: 426, y: 2383),
                      CGPoint(x: 267, y: 2209),
                      CGPoint(x: 117, y: 2055),
                      CGPoint(x: 117, y: 1865),
                      CGPoint(x: 117, y: 1655),
                      CGPoint(x: 267, y: 1480),
                      CGPoint(x: 426, y: 1303),
                      CGPoint(x: 426, y: 1093)]
        
        imagesSteps = [.playStepGrassVertical,
                       .playStepGrassVertical,
                       .playStepGrassHorizontal,
                       .playStepGrassVertical,
                       .playStepGrassHorizontal,
                       .playStepGrassVertical,
                       .playStepGrassHorizontal,
                       .playStepGrassVertical,
                       .playStepGrassVertical,
                       .playStepGrassVertical,
                       .playStepGrassHorizontal,
                       .playStepGrassVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverHorizontal,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverHorizontal,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverVertical,
                       .playStepRiverHorizontal,
                       .playStepRiverVertical,
                       .playStepRiverVertical]
        
        elephantPositions = [ElephantSteps(position: CGPoint(x: 405, y: 7276), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 405, y: 7079), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 382, y: 6863), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 132, y: 6825), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 110, y: 6562), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 431, y: 6535), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 464, y: 6262), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 207, y: 6198), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 168, y: 5982), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 168, y: 5814), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 180, y: 5580), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 409, y: 5518), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 304, y: 4981), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 144, y: 4732), angle: 280, flip: true),
                             ElephantSteps(position: CGPoint(x: 231, y: 4456), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 212, y: 4183), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 77, y: 3938), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 110, y: 3678), angle: -39, flip: true),
                             ElephantSteps(position: CGPoint(x: 376, y: 3610), angle: -63, flip: true),
                             ElephantSteps(position: CGPoint(x: 387, y: 3447), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 387, y: 3276), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 277, y: 3048), angle: 0, flip: false),
                             ElephantSteps(position: CGPoint(x: 348, y: 2775), angle: 0, flip: true),
                             ElephantSteps(position: CGPoint(x: 458, y: 2529), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 436, y: 2271), angle: -292, flip: false),
                             ElephantSteps(position: CGPoint(x: 163, y: 2200), angle: -305, flip: false),
                             ElephantSteps(position: CGPoint(x: 145, y: 2000), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 145, y: 1800), angle: -80, flip: true),
                             ElephantSteps(position: CGPoint(x: 167, y: 1547), angle: -56, flip: true),
                             ElephantSteps(position: CGPoint(x: 426, y: 1490), angle: -56, flip: true),
                             ElephantSteps(position: CGPoint(x: 456, y: 1240), angle: -80, flip: true)]
    }
    
    private func addSteps() {
        for _ in 0..<imagesSteps.count {
            let step = StepsRoute(frame: .zero)
            steps.append(step)
        }
    }
    
    func getSteps() -> [StepsRoute?] {
        addSteps()
        return steps
    }
    
    func getPosition() -> [CGPoint] {
        return positions
    }
    
    func getImagesSteps() -> [ImageSteps] {
        return imagesSteps
    }
    
    func getElephantInSteps() -> [ElephantSteps] {
        return elephantPositions
    }
    
}
