//
//  FruitQuantityLabel.swift
//  JuiceMaker
//
//  Created by 김경록 on 2023/09/21.
//

import UIKit

class FruitQuantityLabel: UILabel {
    func fruit() -> Fruit? { return nil }
}

class StrawberryQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.strawberry.rawValue)
    }
}

class BananaQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.banana.rawValue)
    }
}

class PineappleQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.pineapple.rawValue)
    }
}

class KiwiQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.kiwi.rawValue)
    }
}

class MangoQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.mango.rawValue)
    }
}

