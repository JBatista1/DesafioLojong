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

class VideoDataSorce: NSObject, TableViewDatasource {
    typealias T = VideoImage
    var items: [VideoImage]
    fileprivate let cellId = "id"
    var tableView: UITableView?
    
    required init(items: [VideoImage], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.register(VideoTableCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    
    func setupTableView() {
        tableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? VideoTableCell
        cell?.setupValues(video: items[indexPath.row].video, image: items[indexPath.row].image)
        return cell!
    }
}
