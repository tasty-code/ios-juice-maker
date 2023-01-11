//
//  FruitLabels.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/11.
//

import UIKit

protocol FruitLabelProtocol {
    var fruit: Fruit { get }
}

class StrawberryLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .strawberry
}
class BananaLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .banana
}
class PineappleLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .pineapple
}
class KiwiLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .kiwi
}
class MangoLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .mango
}
