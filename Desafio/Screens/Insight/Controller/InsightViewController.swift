//
//  InsightViewController.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class InsightViewController: UIViewController {
    let customView = Insight(heightSegment: 44)
    var videoDataSource: VideoDataSorce!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        let video = Video(id: "DADSADSAd", name: "tututodaidsa", description: "d,naskdjas", image_url: "jdkashkjdas", aws_url: "djksahdkjsa")
        let videoI = VideoImage(video: video, image: UIImage(named: "model")!)
        videoDataSource = VideoDataSorce(items: [videoI], tableView: customView.information)
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
