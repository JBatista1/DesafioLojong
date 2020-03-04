//
//  UIView+MaskInteroConstraints.swift
//  Empresas_iOS_Desafio
//
//  Created by Joao Batista on 27/02/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func viewCodeMaskConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    func blink(duration: TimeInterval = 0.1, delay: TimeInterval = 0.0, alpha: CGFloat = 0.0) {
            UIView.animate(withDuration: duration, delay: delay, options: [.curveLinear], animations: {
                self.alpha = alpha
            })
            UIView.animate(withDuration: duration, delay: delay, options: [.curveLinear], animations: {
                self.alpha = 1.0
            })
        }
}
