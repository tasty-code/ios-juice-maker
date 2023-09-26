//
//  FruitStockIdentifiableLabels.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitName = .strawberry
}

class BananaStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitName = .banana
}

class KiwiStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitName = .kiwi
}

class PineappleStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitName = .pineapple
}

class MangoStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitName = .mango
}
