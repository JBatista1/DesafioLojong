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
        setupView()
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
