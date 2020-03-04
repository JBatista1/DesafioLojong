//
//  TableViewDatasource.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 08/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit

protocol TableViewDatasource: UITableViewDataSource {
    associatedtype T
    var items:[T] {get}
    var tableView: UITableView? {get}
    
    init(items: [T], tableView: UITableView)
    
    func setupTableView()
}

