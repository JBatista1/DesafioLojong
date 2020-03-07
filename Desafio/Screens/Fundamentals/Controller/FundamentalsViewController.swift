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
        if let steps = customView.steps as? [StepsRoute] {
            setupAction(inButton: steps)
        }

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
    
    func setupAction(inButton buttons: [StepsRoute]) {
        for button in buttons {
            button.step.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        }
    }
    // Adicionar ViewController pra ser chamada de acordo com a tag
    @objc func buttonClicked(sender: UIButton) {
        let tag = sender.tag - 1
        sender.isHighlighted = true
        sender.setImage(customView.imagesSteps[tag].reviewImage, for: .normal)
        sender.setImage(customView.imagesSteps[tag].reviewImage, for: .highlighted)
        
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