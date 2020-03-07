//
//  StepsMockData.swift
//  Desafio
//
//  Created by Joao Batista on 06/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class StepsMockData {
    private let positions: [CGPoint]
    private let positionsElephant: [CGPoint]
    private let imagesSteps: [ImageSteps]
    private let steps: [StepsRoute?]!
    // MARK: Steps in route
    var step1: StepsRoute!
    var step2: StepsRoute!
    var step3: StepsRoute!
    var step4: StepsRoute!
    var step5: StepsRoute!
    var step6: StepsRoute!
    var step7: StepsRoute!
    var step8: StepsRoute!
    var step9: StepsRoute!
    var step10: StepsRoute!
    var step11: StepsRoute!
    var step12: StepsRoute!
    var step13: StepsRoute!
    var step14: StepsRoute!
    var step15: StepsRoute!
    var step16: StepsRoute!
    var step17: StepsRoute!
    var step18: StepsRoute!
    var step19: StepsRoute!
    var step20: StepsRoute!
    var step21: StepsRoute!
    var step22: StepsRoute!
    var step23: StepsRoute!
    var step24: StepsRoute!
    var step25: StepsRoute!
    var step26: StepsRoute!
    var step27: StepsRoute!
    var step28: StepsRoute!
    var step29: StepsRoute!
    var step30: StepsRoute!
    var step31: StepsRoute!
    init() {
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
                      CGPoint(x: 211, y: 3620),
                      CGPoint(x: 358, y: 3483),
                      CGPoint(x: 358, y: 3314),
                      CGPoint(x: 358, y: 3145),
                      CGPoint(x: 149, y: 2869),
                      CGPoint(x: 426, y: 2603),
                      CGPoint(x: 426, y: 2383),
                      CGPoint(x: 267, y: 2210.5),
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
        steps = [step1,step2,step3,step4,step5,step6,step7,step8,step9,step10,step11,step12,step13,step14,step15,step16,step17,step18,step19,step20,step21,step22,step23,step24,step25,step26,step27,step28,step18,step30,step31]
        
        
        positionsElephant = [CGPoint(x: 0, y: 0)
        
        ]
        
    }
    
    private func addSteps() {
        
    }
    func getSteps() -> [StepsRoute?] {
        return steps
    }
    func getPosition() -> [CGPoint] {
        return positions
    }
    func getImagesSteps() -> [ImageSteps] {
        return imagesSteps
    }
    
}
