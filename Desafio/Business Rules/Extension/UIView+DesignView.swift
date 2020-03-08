//
//  UIView+DesignView.swift
//  Empresas_iOS_Desafio
//
//  Created by Joao Batista on 29/02/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeRoundBorder(withCornerRadius corneRadius: CGFloat) {
        layer.cornerRadius = corneRadius
        layer.masksToBounds = true
    }
    
    func insertShadow(withColor color: UIColor, Offset offset: CGSize, Opacity opacity: Float, andRadius radius: CGFloat ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func insertShadowAndCornerRadius(withColor color: UIColor, Offset offset: CGSize, Opacity opacity: Float, Radius radius: CGFloat, andCornerRadius corneRadius: CGFloat ) {
        layer.shadowRadius = radius
        layer.shadowColor =  color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.cornerRadius = corneRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
    func rotation(withValue value: CGFloat) {
        if value != 0 {
            let rotation = CGFloat(value * CGFloat.pi/180)
            self.transform = CGAffineTransform(rotationAngle: rotation)
        }
    }
    static func rotation(withValue value: CGFloat) -> CGAffineTransform {
        let rotation = CGFloat(value * CGFloat.pi/180)
        return CGAffineTransform(rotationAngle: rotation)
        
    }
}
