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

final class StrawberryQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.strawberry.rawValue)
    }
}

final class BananaQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.banana.rawValue)
    }
}

final class PineappleQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.pineapple.rawValue)
    }
}

final class KiwiQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.kiwi.rawValue)
    }
}

final class MangoQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit(rawValue: Fruit.mango.rawValue)
    }
}

