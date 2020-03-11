//
//  QuoteTableCell.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class QuoteTableCell: UITableViewCell {
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.viewCodeMaskConstraints()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(white: 0, alpha: 0)
        return imageView
    }()
    
    let textQuote: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.viewCodeMaskConstraints()
        return label
    }()
    
    let author: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.viewCodeMaskConstraints()
        return label
    }()
    
    let sharing: UIButton = {
        let view = UIButton()
        view.viewCodeMaskConstraints()
        view.backgroundColor = UIColor.grayAppLight
        return view
    }()
    
    let iconSharing: UIImageView = {
        let imageview = UIImageView()
        imageview.viewCodeMaskConstraints()
        imageview.image = UIImage(named: "sharing")?.withRenderingMode(.alwaysTemplate)
        imageview.tintColor = .white
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let textSharing: UILabel = {
        let label = UILabel()
        label.text = "Compartilhar"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.white
        label.viewCodeMaskConstraints()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupValues(quote: String, quoteBackground: QuotesBackground, nameAuthor: String) {
        background.image = quoteBackground.image
        textQuote.text = quote
        textQuote.textColor = quoteBackground.color
        author.textColor = quoteBackground.color
        author.text = nameAuthor
        sharing.backgroundColor = quoteBackground.buttonColor
    }
    
}

extension QuoteTableCell: ViewCodable {
    func buildViewHierarchy() {
        addSubview(background)
        background.addSubview(textQuote)
        background.addSubview(author)
        addSubview(sharing)
        sharing.addSubview(iconSharing)
        sharing.addSubview(textSharing)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            textQuote.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 25),
            textQuote.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -25),
            textQuote.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: -30),
            textQuote.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            author.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0),
            author.topAnchor.constraint(equalTo: textQuote.bottomAnchor, constant: 18)
        ])
        
        NSLayoutConstraint.activate([
            sharing.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0),
            sharing.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -17),
            sharing.heightAnchor.constraint(equalToConstant: 30),
            sharing.widthAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            iconSharing.heightAnchor.constraint(equalToConstant: 14),
            iconSharing.widthAnchor.constraint(equalToConstant: 14),
            iconSharing.leadingAnchor.constraint(equalTo: sharing.leadingAnchor, constant: 6),
            iconSharing.centerYAnchor.constraint(equalTo: sharing.centerYAnchor, constant: 0)
            
        ])
        NSLayoutConstraint.activate([
            textSharing.leadingAnchor.constraint(equalTo: iconSharing.trailingAnchor, constant: 7),
            textSharing.centerYAnchor.constraint(equalTo: sharing.centerYAnchor, constant: 0)
        ])
    }
    
    func setupAdditionalConfiguration() {
            
         sharing.makeRoundBorder(withCornerRadius: 10)
    }
}
