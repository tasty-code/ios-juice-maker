//
//  FruitQunatityStepper.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/26.
//

import Foundation
import UIKit

class FruitQuantityStepper: UIStepper {
    func fruit() -> Fruit? { return nil }
}

final class StrawberryQuantityStepper: FruitQuantityStepper {
    override func fruit() -> Fruit? {
        return Fruit.strawberry
    }
}

final class BananaQuantityStepper: FruitQuantityStepper {
    override func fruit() -> Fruit? {
        return Fruit.banana
    }
}

final class PineappleQuantityStepper: FruitQuantityStepper {
    override func fruit() -> Fruit? {
        return Fruit.pineapple
    }
}

final class KiwiQuantityStepper: FruitQuantityStepper {
    override func fruit() -> Fruit? {
        return Fruit.kiwi
    }
}

final class MangoQuantityStepper: FruitQuantityStepper {
    override func fruit() -> Fruit? {
        return Fruit.mango
    }
}

