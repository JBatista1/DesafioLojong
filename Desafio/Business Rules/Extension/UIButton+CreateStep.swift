//
//  UIButton+CreateStep.swift
//  Desafio
//
//  Created by Joao Batista on 06/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(image: UIImage, frame: CGRect, valueTag: Int) {
        self.init(frame: frame)
        setImage(image, for: .normal)
        tag = valueTag
    }
}
