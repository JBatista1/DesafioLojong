//
//  ArticleDataSource.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class ArticleDataSource: NSObject, TableViewDatasource {
    typealias T = ArticleImage
    var items: [ArticleImage]
    fileprivate let cellId = "id"
    var tableView: UITableView?
    var tag = 0
    
    required init(items: [ArticleImage], tableView: UITableView) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? ArticleTableCell
        cell?.setupValues(article: items[indexPath.row].article, image: items[indexPath.row].image)
        return cell!
        
    }
}
