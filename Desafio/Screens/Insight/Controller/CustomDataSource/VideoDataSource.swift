//
//  VideoDataSorce.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

protocol VideoDataSorceDelegate: class {
    func buttonClicked(tag: Int)
}

class VideoDataSource: NSObject, TableViewDatasource {
    typealias T = Video
    var items: [Video]
    fileprivate let cellId = "id"
    var tableView: UITableView?
    weak var delegate: VideoDataSorceDelegate?
    var tag = 0
    
    required init(items: [Video], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.register(VideoTableCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    
    func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? VideoTableCell
        cell?.photo.setImage(UIImage(named: "imageDefault"), for: .normal)
        cell?.setupValues(video: items[indexPath.row])
        cell?.photo.tag = indexPath.row
        
        cell?.photo.addTarget(self, action: #selector(playVideo(sender:)), for: .touchUpInside)
        cell?.backgroundColor = .white
        cell?.photo.tag = indexPath.row
        return cell!
    }
    
    @objc func playVideo(sender: UIButton) {
        delegate?.buttonClicked(tag: sender.tag)
        
    }
}
