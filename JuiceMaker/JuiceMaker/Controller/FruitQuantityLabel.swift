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
        return Fruit.strawberry
    }
}

final class BananaQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit.banana
    }
}

final class PineappleQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit.pineapple
    }
}

final class KiwiQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit.kiwi
    }
}

final class MangoQuantityLabel: FruitQuantityLabel {
    override func fruit() -> Fruit? {
        return Fruit.mango
    }
}

