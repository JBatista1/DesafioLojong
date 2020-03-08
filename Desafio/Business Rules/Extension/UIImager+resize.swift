//
//  UIImager+resize.swift
//  Desafio
//
//  Created by Joao Batista on 05/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func decrease(basedWidth: CGFloat) -> UIImage {
        let size = self.size
        let proportion = getProportionResize(basedInLasteWidth: size.width, andNewWidth: basedWidth)
        let newSize = CGSize(width: basedWidth, height: size.height * proportion)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    func getProportionResize(basedInLasteWidth widthOriginal: CGFloat, andNewWidth widthNew: CGFloat) -> CGFloat {
        let difference =  (widthOriginal - widthNew)
        let proportion =  1 - (difference / widthOriginal)
        return proportion
    }
}
