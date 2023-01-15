//
//  stepperAttribute.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/15.
//

import UIKit

final class StrawberryStepper: UIStepper, Gettable {
    var fruit: Fruit = .strawberry
}

final class BananaStepper: UIStepper, Gettable {
    var fruit: Fruit = .banana
}

final class PineAppleStepper: UIStepper, Gettable {
    var fruit: Fruit = .pineApple
}

final class KiwiStepper: UIStepper, Gettable {
    var fruit: Fruit = .kiwi
}

final class MangoStepper: UIStepper, Gettable {
    var fruit: Fruit = .mango
}
