//
//  QuoteDataSource.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

protocol QuoteDataSourceDelegate: class {
    func sharing(tag: Int)
}
class QuoteDataSource: NSObject, TableViewDatasource {
    typealias T = Quote
    var items: [Quote]
    fileprivate let cellId = "quote"
    var tableView: UITableView?
    weak var delegate: QuoteDataSourceDelegate?
    
    required init(items: [Quote], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.rowHeight = 368.0
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "quote", for: indexPath) as? QuoteTableCell
        let split = splitText(theText: items[indexPath.row].text)
        cell?.background.image = UIImage()
        
        cell?.setupValues(quote: split.quote, quoteBackground: decideBacGround(row: indexPath.row), nameAuthor: split.author )
        cell?.backgroundColor = .white
        cell?.sharing.addTarget(self, action: #selector(sharingQuote(sender:)), for: .touchUpInside)
        cell?.sharing.tag = indexPath.row
        return cell!
    }
    
    @objc func sharingQuote(sender: UIButton) {
        delegate?.sharing(tag: sender.tag)
    }
    
    func decideBacGround(row: Int) -> QuotesBackground {
        
        switch row%3 {
        case 0:
            return .blue
        case 1 :
            return .yellow
        case 2 :
            return .orange
        default:
            return .blue
        }
        
    }
    func splitText(theText text: String) -> (quote: String, author: String) {
        let quote = text.components(separatedBy: "&nbsp;&ndash;&nbsp;")
        return (quote[0], quote[1])
    }
}
