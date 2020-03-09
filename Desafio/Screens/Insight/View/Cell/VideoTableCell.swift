//
//  VideoTableCell.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
class VideoTableCell: UITableViewCell {
    private let provider = URLSessionProvider()
    
    let titleVideo: UILabel = {
        let label = UILabel()
        label.text = "EP. 02: Ciência e Meditação.".uppercased()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.grayApp
        label.viewCodeMaskConstraints()
        return label
    }()
    
    let photo: UIButton = {
        let button = UIButton()
        button.viewCodeMaskConstraints()
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let play: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.viewCodeMaskConstraints()
        imageView.image = UIImage(named: "play")
        return imageView
    }()
    
    let descriptionVideo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.grayApp
        label.viewCodeMaskConstraints()
        return label
    }()
    
    let sharing: UIView = {
        let view = UIView()
        view.viewCodeMaskConstraints()
        view.backgroundColor = UIColor.grayAppLight
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let iconSharing: UIImageView = {
        let imageview = UIImageView()
        imageview.viewCodeMaskConstraints()
        imageview.image = UIImage(named: "sharing")
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    let textSharing: UILabel = {
        let label = UILabel()
        label.text = "Compartilhar"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.grayApp
        label.viewCodeMaskConstraints()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    func setupValues(video: Video) {
        titleVideo.text = video.name.uppercased()
        descriptionVideo.text = video.videosDAODescription
        requestImage(url: video.imageURL)
        
    }
    
    func requestImage(url: String) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.photo.setImage(UIImage(data: data), for: .normal)
            }
        }.resume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoTableCell: ViewCodable {
    func buildViewHierarchy() {
        addSubview(titleVideo)
        addSubview(photo)
        photo.addSubview(play)
        addSubview(descriptionVideo)
        addSubview(sharing)
        sharing.addSubview(iconSharing)
        sharing.addSubview(textSharing)
    }
    
    func setupConstraints() {
        let margin: CGFloat = 30
        NSLayoutConstraint.activate([
            titleVideo.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            titleVideo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin + 10),
            titleVideo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin-10)
            
        ])
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: titleVideo.bottomAnchor, constant: 10),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            photo.heightAnchor.constraint(equalToConstant: 175)
            
        ])
        
        NSLayoutConstraint.activate([
            play.heightAnchor.constraint(equalToConstant: 40),
            play.widthAnchor.constraint(equalToConstant: 40),
            play.centerYAnchor.constraint(equalTo: photo.centerYAnchor, constant: 0),
            play.centerXAnchor.constraint(equalTo: photo.centerXAnchor, constant: 0)
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionVideo.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 13),
            descriptionVideo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin + 13 ),
            descriptionVideo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin - 13)
        ])
        
        NSLayoutConstraint.activate([
            sharing.topAnchor.constraint(equalTo: descriptionVideo.bottomAnchor, constant: 16),
            sharing.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            sharing.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
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
        photo.makeRoundBorder(withCornerRadius: 20)
        sharing.makeRoundBorder(withCornerRadius: 15)
        
    }
    
}
