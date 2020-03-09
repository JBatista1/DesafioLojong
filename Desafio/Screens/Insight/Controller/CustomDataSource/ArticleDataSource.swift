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
    typealias T = Article
    var items: [Article]
    fileprivate let cellId = "article"
    var tableView: UITableView?
 
    required init(items: [Article], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.register(ArticleTableCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    
    func setupTableView() {
        tableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ArticleTableCell
        cell?.photo.image = UIImage(named: "imageDefault")
        cell?.setupValues(articleImage: items[indexPath.row])
        cell?.backgroundColor = .white
        return cell!
        
    }
    func getImage(url: String) -> UIImage {
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        return UIImage(data: data!)!
    }
    
    func updateImage(index: Int) {
        
    }
}
