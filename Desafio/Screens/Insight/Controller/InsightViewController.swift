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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
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
