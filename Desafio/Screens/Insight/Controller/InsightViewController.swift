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
    private let provider = URLSessionProvider()
    
    var videoDataSource: VideoDataSource!
    var quoteDataSource: QuoteDataSource!
    var articleDataSource: ArticleDataSource!
    var videos: [Video] = []
    var articles: [Article] = []
    var quaotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        requestArticles()
        
       
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
        switch sender.tag {
        case 0:
            videoDataSource = VideoDataSource(items: videos, tableView: customView.table)
            videoDataSource.delegate = self
        case 1:
            articleDataSource = ArticleDataSource(items: articles, tableView: customView.table)
        case 2:
            quoteDataSource = QuoteDataSource(items: quaotes, tableView: customView.table)
            quoteDataSource.delegate = self
        default:
            return
        }
        customView.table.reloadData()
    }
    
    func toTop() {
        let indexPath = IndexPath(row: 0, section: 0)
        customView.table.scrollToRow(at: indexPath, at: .top, animated: false)
    }
}

// MARK: Delegates DataSource
extension InsightViewController: VideoDataSorceDelegate, QuoteDataSourceDelegate {
    
    func sharing(tag: Int) {
        let index = IndexPath(item: tag, section: 0)
        let cell = customView.table.cellForRow(at: index) as? QuoteTableCell
        let imagesharing = cell?.background
        imagesharing?.backgroundColor = UIColor.init(white: 1, alpha: 0)
        let image = imagesharing?.asImage()
        showSharingFact(image: image! )
        
    }
    
    func showSharingFact(image: UIImage) {
        let activitityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(activitityController, animated: true)
        
    }
    
    func buttonClicked(tag: Int) {
        let url = videos[tag].awsURL
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

// MARK: Requests
extension InsightViewController {
    func requestVideos() {
        provider.request(type: VideosDAO.self, service: NetworkService.getVideos) { (response) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    self.videos = result
                    self.videoDataSource = VideoDataSource(items: self.videos, tableView: self.customView.table)
                    self.videoDataSource.delegate = self
                    self.requestQuotes()
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    
    func requestArticles() {
        provider.request(type: ArticleDAO.self, service: NetworkService.getArticle) { (response) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    self.articles = result.articles
                    self.requestVideos()
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    func requestQuotes() {
        provider.request(type: QuoteDAO.self, service: NetworkService.getQuote) { (response) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    self.quaotes = result
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    
}
