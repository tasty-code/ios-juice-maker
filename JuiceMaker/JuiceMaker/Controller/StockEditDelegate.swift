//
//  StockEditonDelegate.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/26.
//

import Foundation

protocol StockEditDelegate {
    func sendChangedStock(_ fruitStock: [Fruit : Int])
}
