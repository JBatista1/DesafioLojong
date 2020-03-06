//
//  FundamentalsViewController.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class FundamentalsViewController: UIViewController {
    let customView = Fundamentals(positionsButtons: [CGPoint(x: 0, y: 0)])
    var first = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBart()
    }
    override func loadView() {
        view = customView
        
    }
    
    override func viewDidLayoutSubviews() {
        if first {
            guard let position = (customView.route.image?.size.height) else {return}
            customView.scrollRoute.contentOffset.y =  position
            first = false
        }
        
    }
    
    func setupNavigationBart() {
        navigationItem.title = "FUNDAMENTOS"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.greenApp
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setShadows()
        let leftIcon = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButton(sender:)))
        navigationItem.leftBarButtonItem = leftIcon
        
    }
    
    @objc func backButton(sender: UIButton) {}
}
