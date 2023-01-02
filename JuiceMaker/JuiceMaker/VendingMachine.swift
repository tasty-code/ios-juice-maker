//
//  VendingMachine.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/02.
//

import Foundation

protocol VendingMachine {
    var cash: Int { get set }
    
    func insertCash()
    func exchange()
    func chooseProduct() -> String
    func outProduct() -> Product
}
