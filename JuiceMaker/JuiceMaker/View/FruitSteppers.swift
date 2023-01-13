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

final class StrawberryStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .strawberry
}

final class BananaStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .banana
}

final class PineappleStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .pineapple
}

final class KiwiStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .kiwi
}

final class MangoStepper: UIStepper, FruitStepperProtocol {
    var fruit: Fruit = .mango
}
