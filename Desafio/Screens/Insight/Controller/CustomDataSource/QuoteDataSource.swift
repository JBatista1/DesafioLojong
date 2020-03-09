//
//  QuoteDataSource.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class QuoteDataSource: NSObject, TableViewDatasource {
    typealias T = QuoteAuthor
    var items: [QuoteAuthor]
    fileprivate let cellId = "id"
    var tableView: UITableView?
    var tag = 0
    
    required init(items: [QuoteAuthor], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.rowHeight = 385.0
        tableView.register(QuoteTableCell.self, forCellReuseIdentifier: cellId)
        self.setupTableView()
    }
    
    func setupTableView() {
        tableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? QuoteTableCell
        cell?.setupValues(quote: items[indexPath.row], quoteBackground: .blue)
        cell?.backgroundColor = .white
        return cell!
        
    }
}
