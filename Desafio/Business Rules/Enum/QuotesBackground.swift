//
//  QuotesBackground.swift
//  Desafio
//
//  Created by Joao Batista on 09/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

enum QuotesBackground {
    case blue
    case yellow
    case orange
    
    var image: UIImage {
        switch self {
        case .blue:
            return UIImage(named: "blue")!
        case .yellow:
            return UIImage(named: "yellow")!
        case .orange:
            return UIImage(named: "orange")!
            
        }
    }
    var color: UIColor {
        switch self {
        case .blue:
            return UIColor.blueApp!
        case .yellow:
            return UIColor.brownApp!
        case .orange:
            return UIColor.white
        }
        
    }
    var buttonColor: UIColor {
        switch self {
        case .blue:
            return UIColor.blueApp!
        case .yellow, .orange:
            return UIColor(white: 1, alpha: 0.25)
        }
    }
    
}
