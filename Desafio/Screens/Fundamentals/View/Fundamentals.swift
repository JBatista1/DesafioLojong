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
    var proportion: CGFloat!
    let stepsMock = StepsMockData()
    var positions: [CGPoint]!
    var imagesSteps: [ImageSteps]!
    var elephantPositions: [ElephantSteps]!
    var steps: [StepsRoute?]!
    var staticTranformation: CGAffineTransform!
    
    let route: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "route")?.decrease(basedWidth: UIScreen.main.bounds.width)
        imageView.viewCodeMaskConstraints()
        return imageView
    }()
    
    var elephant: UIImageView = {
        let imageView = UIImageView(image: ImageSteps.elephantGrass.image)
        imageView.contentMode = .scaleAspectFit
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
        super.init(frame: .zero)
        setProportion()
        setupView()
        staticTranformation = elephant.transform
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func resetElephantTranform() {
        elephant.transform = staticTranformation
        layoutSubviews()
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
         setupSteps()
    }
    
}

// MARK: SET STEPS
extension Fundamentals {
    private func setupSteps() {
        steps = stepsMock.getSteps()
        positions = stepsMock.getPosition()
        imagesSteps = stepsMock.getImagesSteps()
        elephantPositions = stepsMock.getElephantInSteps()
        for index in 0..<steps.count {
            createSteps(step: &steps[index], imageStep: imagesSteps[index], tag: index)
        }
        
        elephant.frame = CGRect.createFrame(size: ImageSteps.elephantGrass.size, point: CGPoint(x: 405, y: 7276), proportion: proportion)
        scrollRoute.addSubview(elephant)
        
    }
    private func createSteps(step: inout StepsRoute?, imageStep: ImageSteps, tag: Int) {
        let frame = CGRect.createFrame(size: imageStep.size, point: positions[tag], proportion: proportion)
        step = StepsRoute(imageStep: imageStep, frame: frame, tag: tag+1)
        scrollRoute.addSubview(step!)
    }

    private func setProportion() {
        let imageWidth = (UIImage(named: "route")?.size.width)!
        let screenWidth = (UIScreen.main.bounds.width)
        proportion = UIImage(named: "route")?.getProportionResize(basedInLasteWidth: imageWidth, andNewWidth: screenWidth)
    }
    
}
