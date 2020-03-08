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
    func move(toFrame center: CGPoint) {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn], animations: {
            self.center = center
        })
    }
}
