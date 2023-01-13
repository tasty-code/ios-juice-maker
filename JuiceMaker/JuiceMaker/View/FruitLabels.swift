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

final class StrawberryLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .strawberry
}

final class BananaLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .banana
}

final class PineappleLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .pineapple
}

final class KiwiLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .kiwi
}

final class MangoLabel: UILabel, FruitLabelProtocol {
    var fruit: Fruit = .mango
}
