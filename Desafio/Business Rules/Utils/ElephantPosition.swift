//
//  ElephantPosition.swift
//  Desafio
//
//  Created by Joao Batista on 08/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class ElephantPosition {
    private var stepsTaken: [Bool] = []
    private let elephantStep: UIImageView
    private let proportion: CGFloat!
    private let elephantPositions: [ElephantSteps]
    private var tag = 0
    
    init(imageView: UIImageView, proportion: CGFloat, elephantPositions: [ElephantSteps]) {
        self.elephantStep = imageView
        self.proportion = proportion
        self.elephantPositions = elephantPositions
        fillArray(numberElements: elephantPositions.count)
    }
    
    func movedElephant(basedTag tag: Int) {
        if tag == 30 {
            finishRoute()
            return
        }
        if stepsTaken[tag] == true {return}
        stepsTaken[tag] = true
        if stepsTaken[0] {
            verifyIfMoved()
        }
    }
    private func verifyIfMoved() {
        
        let lastStep = lastStepSequence(numberElements: stepsTaken.count)
        if tag == lastStep - 1 || stepsTaken[tag+1] {
            self.tag = lastStepSequence(numberElements: stepsTaken.count)
            createNewFrame()
            changeImageElephant()
        }
    }
    
    private func lastStepSequence(numberElements: Int) -> Int {
        for index in 0..<numberElements {
            if !stepsTaken[index] {
                return index
            }
        }
        return 0
    }
    
    private func finishRoute() {
        elephantStep.image = UIImage()
    }
    
    private func fillArray(numberElements: Int) {
        for _ in 0..<numberElements {
            stepsTaken.append(false)
        }
    }
    
    private func changeImageElephant() {
        if tag > 11 {
            elephantStep.image = ImageSteps.elephantGrass.reviewImage
        }
        elephantStep.transform = UIView.rotation(withValue: elephantPositions[tag].angle)
        if elephantPositions[tag].flip {
            elephantStep.image = elephantStep.image?.withHorizontallyFlippedOrientation()
        }
    }
    
    private func createNewFrame() {
        let position = elephantPositions[tag].position
        elephantStep.frame = CGRect.createFrame(size: ImageSteps.elephantGrass.size, point: position, proportion: proportion)
    }
    
}
