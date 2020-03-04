//
//  Home.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

// MARK: Exemple view using ViewCodable

import UIKit

class Home: UIView {
    
    let screen: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.makeRoundBorder(withCornerRadius: 10)
        view.viewCodeMaskConstraints()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Home: ViewCodable {
    func buildViewHierarchy() {
        addSubview(screen)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            screen.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            screen.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.2),
            screen.centerYAnchor.constraint(equalTo: centerYAnchor),
            screen.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
}
