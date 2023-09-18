//
//  FruitStockIdentifiableLabels.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .strawberry
}

class BananaStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .banana
}

class KiwiStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .kiwi
}

class PineappleStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .pineapple
}

class MangoStockLabel: UILabel, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .mango
}
