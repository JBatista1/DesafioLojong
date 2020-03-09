//
//  InsightViewController.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit
import AVKit

class InsightViewController: UIViewController {
    let customView = Insight(heightSegment: 44)
    var videoDataSource: VideoDataSource!
    var videos: [VideoImage] = []
    var articles: [ArticleImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        let video = Video(id: "DADSADSAd", name: "tututodaidsa", description: "d,naskdjas", image_url: "jdkashkjdas", aws_url: "https://d35mkqei6qg744.cloudfront.net/pt/videos/1felicidadegenuina.mp4")
        
        let videoI = VideoImage(video: video, image: UIImage(named: "model")!)
        videos.append(videoI)
        videos.append(videoI)
        videoDataSource = VideoDataSource(items: videos, tableView: customView.information)
        videoDataSource.delegate = self
    }
    
    func setupActions() {
        customView.video.addTarget(self, action: #selector(changeTable(sender:)), for: .touchUpInside)
        customView.article.addTarget(self, action: #selector(changeTable(sender:)), for: .touchUpInside)
        customView.quote.addTarget(self, action: #selector(changeTable(sender:)), for: .touchUpInside)
    }
    
    override func loadView() {
        view = customView
    }
    
    @objc func changeTable(sender: UIButton) {
        customView.defaultColorButton()
        sender.setTitleColor(UIColor.redLowSaturation2, for: .normal)
        customView.thumbView.move(toFrame: sender.center)
    }
}

extension InsightViewController: VideoDataSorceDelegate {
    func buttonClicked(tag: Int) {
        print(tag)
        let url = videos[tag].video.aws_url
        let videoURLString = url
        if let url = URL(string: videoURLString) {
            let videoURL = url
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            
            present(playerViewController, animated: true) {
                player.play()
            }
        }
    }
    
}
