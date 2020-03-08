//
//  CGRect+CreateFrame.swift
//  Desafio
//
//  Created by Joao Batista on 07/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
   static func createFrame(size: CGSize, point: CGPoint, proportion: CGFloat ) -> CGRect {
        let frame = CGRect(x: point.x * proportion, y: point.y * proportion, width: size.width * proportion, height: size.height * proportion)
        return frame
    }
}
