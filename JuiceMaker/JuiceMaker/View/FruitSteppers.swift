//
//  FruitSteppers.swift
//  JuiceMaker
//
//  Created by 김보미 on 2023/01/12.
//

import Foundation
import UIKit

class StrawberryStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .strawberry
}

class BananaStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .banana
}

class PineappleStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .pineapple
}

class KiwiStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .kiwi
}

class MangoStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .mango
}
