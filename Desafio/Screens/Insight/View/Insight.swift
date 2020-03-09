//
//  Insight.swift
//  Desafio
//
//  Created by Joao Batista on 08/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class Insight: UIView {
    private let heightSegment: CGFloat
    private let margin: CGFloat = 8
    private var heightButton: CGFloat = 0
    
    let segment: UIScrollView = {
        let scroll = UIScrollView()
        scroll.viewCodeMaskConstraints()
        scroll.backgroundColor = UIColor.redLowSaturation2
        return scroll
    }()
    
    var table: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 600
        table.backgroundColor = UIColor.whiteApp
        table.viewCodeMaskConstraints()
        return table

    }()
    let thumbView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.viewCodeMaskConstraints()
        return view
    }()
    
    let video: UIButton = {
        let button = UIButton()
        button.setTitle("VÍDEOS", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.redLowSaturation2, for: .normal)
        button.setTitleColor(UIColor.redLowSaturation, for: .highlighted)
        button.tag = 0
        button.viewCodeMaskConstraints()
        return button
    }()
    
    let article: UIButton = {
        let button = UIButton()
        button.setTitle("ARTIGOS", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.redLowSaturation, for: .highlighted)
        button.tag = 1
        button.viewCodeMaskConstraints()
        return button
    }()
    let quote: UIButton = {
        let button = UIButton()
        button.setTitle("CITAÇÕES", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.redLowSaturation, for: .highlighted)
        button.tag = 2
        button.viewCodeMaskConstraints()
        return button
    }()
    
    init(heightSegment: CGFloat) {
        self.heightSegment = heightSegment
        super.init(frame: .zero)
        
        backgroundColor = UIColor.redLowSaturation
        setupView()
    }
    func defaultColorButton () {
        article.setTitleColor(.white, for: .normal)
        quote.setTitleColor(.white, for: .normal)
        video.setTitleColor(.white, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Insight: ViewCodable {
    func buildViewHierarchy() {
        addSubview(segment)
        segment.addSubview(thumbView)
        segment.addSubview(video)
        segment.addSubview(article)
        segment.addSubview(quote)
        addSubview(table)
        
    }
    
    func setupConstraints() {
        let widthButtons = (UIScreen.main.bounds.width - margin * 2) / 3
        heightButton = heightSegment - 10
        
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 14),
            segment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            segment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            segment.heightAnchor.constraint(equalToConstant: heightSegment)
            
        ])
        NSLayoutConstraint.activate([
            video.centerYAnchor.constraint(equalTo: segment.centerYAnchor, constant: 0),
            video.widthAnchor.constraint(equalToConstant: widthButtons),
            video.heightAnchor.constraint(equalToConstant: heightButton),
            video.leadingAnchor.constraint(equalTo: segment.leadingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            article.centerYAnchor.constraint(equalTo: segment.centerYAnchor, constant: 0),
            article.widthAnchor.constraint(equalToConstant: widthButtons),
            article.heightAnchor.constraint(equalToConstant: heightButton),
            article.leadingAnchor.constraint(equalTo: video.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            quote.centerYAnchor.constraint(equalTo: segment.centerYAnchor, constant: 0),
            quote.widthAnchor.constraint(equalToConstant: widthButtons),
            quote.heightAnchor.constraint(equalToConstant: heightButton),
            quote.leadingAnchor.constraint(equalTo: article.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            thumbView.centerYAnchor.constraint(equalTo: segment.centerYAnchor, constant: 0),
            thumbView.heightAnchor.constraint(equalToConstant: heightButton ),
            thumbView.widthAnchor.constraint(equalToConstant: widthButtons - 8),
            thumbView.centerXAnchor.constraint(equalTo: video.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func setupAdditionalConfiguration() {
        segment.makeRoundBorder(withCornerRadius: heightSegment/2)
        thumbView.makeRoundBorder(withCornerRadius: heightButton/2)
    }
    
}
