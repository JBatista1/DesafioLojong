//
//  Fundamentals.swift
//  Desafio
//
//  Created by Joao Batista on 05/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class Fundamentals: UIView {
    private let numberSteps: Int
    private let positionsButtons: [CGPoint]
    var proportion: CGFloat!
    var positions: [CGPoint]!
    var imagesSteps: [ImageSteps]!
    let stepsMock = StepsMockData()
    var steps: [StepsRoute?]!
    
    let route: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "route")?.decrease(basedWidth: UIScreen.main.bounds.width)
        imageView.viewCodeMaskConstraints()
        return imageView
    }()
    
    let scrollRoute: UIScrollView = {
        let scroll = UIScrollView()
        scroll.viewCodeMaskConstraints()
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false
        return scroll
    }()
    
    init(positionsButtons: [CGPoint]) {
        self.numberSteps = positionsButtons.count
        self.positionsButtons = positionsButtons
        super.init(frame: .zero)
        setProportion()
        setupView()
        setupSteps()
    }
    
    private func setupSteps() {
        steps = stepsMock.getSteps()
        positions = stepsMock.getPosition()
        imagesSteps = stepsMock.getImagesSteps()
        
        for index in 0..<steps.count {
            createSteps(step: &steps[index], imageStep: imagesSteps[index], tag: index)
        }
        
        //Ajustar a cuvartura do rio
        steps[24]!.transform = CGAffineTransform(rotationAngle: CGFloat(1 * CGFloat.pi/180))
        steps[10]!.transform = CGAffineTransform(rotationAngle: CGFloat(-1 * CGFloat.pi/180))
        
    }
    
    func createSteps(step: inout StepsRoute?, imageStep: ImageSteps, tag: Int) {
        step = StepsRoute(imageStep: imageStep, frame: createFrame(imagestep: imageStep, point: positions[tag]), tag: tag+1)
        scrollRoute.addSubview(step!)
    }
    
    func createFrame(imagestep: ImageSteps, point: CGPoint) -> CGRect {
        let frame = CGRect(x: point.x * proportion, y: point.y * proportion, width: imagestep.size.width * proportion, height: imagestep.size.height * proportion)
        return frame
    }
    
    private func setProportion() {
        let imageWidth = (UIImage(named: "route")?.size.width)!
        let screenWidth = (UIScreen.main.bounds.width)
        proportion = UIImage(named: "route")?.getProportionResize(basedInLasteWidth: imageWidth, andNewWidth: screenWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension Fundamentals: ViewCodable {
    func buildViewHierarchy() {
        addSubview(scrollRoute)
        scrollRoute.addSubview(route)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollRoute.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollRoute.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollRoute.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollRoute.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            route.topAnchor.constraint(equalTo: scrollRoute.topAnchor, constant: 0),
            route.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            route.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            route.bottomAnchor.constraint(equalTo: scrollRoute.bottomAnchor, constant: 0)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
    }
    
}
