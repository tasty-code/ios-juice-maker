//
//  FruitStockIdentifiableButtons.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .strawberry
}

class BananaStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .banana
}

class KiwiStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .kiwi
}

class PineappleStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .pineapple
}

class MangoStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .mango
}
