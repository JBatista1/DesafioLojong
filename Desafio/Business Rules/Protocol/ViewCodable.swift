//
//  ViewCodable.swift
//  Empresas_iOS_Desafio
//
//  Created by Joao Batista on 27/02/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCodable {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
