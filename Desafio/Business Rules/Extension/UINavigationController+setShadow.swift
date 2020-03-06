//
//  UINavigationController+setShadow.swift
//  Desafio
//
//  Created by Joao Batista on 05/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func setShadows() {
        self.navigationBar.layer.masksToBounds = false
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationBar.layer.shadowOpacity = 0.2
        self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationBar.layer.shadowRadius = 2
    }
}
