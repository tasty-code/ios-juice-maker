//
//  FruitLabel.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

import UIKit

extension FruitComponent where Self:UILabel {
    var stock: Int {
        get {
            Int(self.text ?? "0") ?? 0
        }
        set {
            self.text = String(newValue)
        }
    }
}

final class StrawberryLabel: UILabel, FruitComponent {
    var fruit:Fruit { .strawberry }
}

final class BananaLabel: UILabel, FruitComponent {
    var fruit:Fruit { .banana }
}

final class PineappleLabel: UILabel, FruitComponent {
    var fruit:Fruit { .pineapple }
}

final class KiwiLabel: UILabel, FruitComponent {
    var fruit:Fruit { .kiwi }
}

final class MangoLabel: UILabel, FruitComponent {
    var fruit:Fruit { .mango }
}
