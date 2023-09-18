//
//  FruitStockIdentifiableButtons.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/18.
//

import UIKit

class StrawberryStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .strawberry
}

class BananaStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .banana
}

class KiwiStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .kiwi
}

class PineappleStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .pineapple
}

class MangoStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitStore.FruitType = .mango
}
