//
//  FruitLabels.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/12.
//

import Foundation
import UIKit

class StrawberryStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .strawberry
}

class BananaStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .banana
}

class PineappleStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .pineapple
}

class KiwiStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .kiwi
}

class MangoStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .mango
}
