//
//  StepsRoute.swift
//  Desafio
//
//  Created by Joao Batista on 06/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class StepsRoute: UIView {
    let day: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.brownApp
        label.viewCodeMaskConstraints()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let step: UIButton = {
        let button =  UIButton()
        button.viewCodeMaskConstraints()
        button.isHighlighted = true
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(imageStep: ImageSteps, frame: CGRect, tag: Int) {
        super.init(frame: frame)
        setupView()
        step.setImage(imageStep.image, for: .highlighted)
        step.tag = tag
        addtextInDay(tag: tag)
    }
    func addtextInDay(tag: Int) {
        day.text = "Dia \(tag)"
        if tag > 12 {
            day.textColor = .white
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StepsRoute: ViewCodable {
    func buildViewHierarchy() {
        addSubview(step)
        step.addSubview(day)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            step.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            step.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            step.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            step.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        ])
        NSLayoutConstraint.activate([
            day.leadingAnchor.constraint(equalTo: step.leadingAnchor, constant: 10),
            day.trailingAnchor.constraint(equalTo: step.trailingAnchor, constant: -10),
            day.bottomAnchor.constraint(equalTo: step.bottomAnchor, constant: -25)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
    }
    
}
