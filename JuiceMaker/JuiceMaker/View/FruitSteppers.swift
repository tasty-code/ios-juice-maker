//
//  FruitSteppers.swift
//  JuiceMaker
//
//  Created by Mason Kim on 2023/01/11.
//

import UIKit

protocol FruitStepperProtocol {
    var fruit: Fruit { get }
}

class StrawberryStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .strawberry
}

class BananaStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .banana
}

class PineappleStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .pineapple
}

class KiwiStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .kiwi
}

class MangoStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .mango
}
