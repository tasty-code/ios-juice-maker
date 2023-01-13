//
//  FruitStepper.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

import UIKit

extension FruitComponent where Self:UIStepper {
    var stock: Int {
        get {
            Int(self.value)
        }
        set {
            self.value = Double(newValue)
        }
    }
}

final class StrawberryStepper: UIStepper, FruitComponent {
    var fruit:Fruit { .strawberry }
}

final class BananaStepper: UIStepper, FruitComponent {
    var fruit:Fruit { .banana }
}

final class PineappleStepper: UIStepper, FruitComponent {
    var fruit:Fruit { .pineapple }
}

final class KiwiStepper: UIStepper, FruitComponent {
    var fruit:Fruit { .kiwi }
}

final class MangoStepper: UIStepper, FruitComponent {
    var fruit:Fruit { .mango }
}
