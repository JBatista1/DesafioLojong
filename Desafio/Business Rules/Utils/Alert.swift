//
//  Alert.swift
//  Empresas_iOS_Desafio
//
//  Created by Joao Batista on 01/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit
class Alert {
    
    private var alert: UIAlertController
    
    init() {
        self.alert = UIAlertController()
    }
    
    func errorNetworkUnknown() -> UIAlertController {
        let alert = UIAlertController(title: "Não foi possivel realizar o Login", message: "Tente novamente e caso o problema persista, entre em contato conosco.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    }

}
