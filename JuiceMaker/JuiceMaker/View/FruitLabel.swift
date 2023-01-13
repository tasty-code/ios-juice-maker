//
//  FruitLabel.swift
//  JuiceMaker
//
//  Created by 박재우 on 2023/01/13.
//

import UIKit

class FruitLabel: UILabel {
    var fruit: Fruits?

    func setting() {
        guard let fruit = self.fruit else {
            return
        }
        text = FruitStore.shared.stock(fruit: fruit)?.description
    }
}

class StrawberryLabel: FruitLabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .strawberry
        setting()
    }
}

class BananaLabel: FruitLabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .banana
        setting()
    }
}

class PineappleLabel: FruitLabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .pineapple
        setting()
    }
}

class KiwiLabel: FruitLabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .kiwi
        setting()
    }
}

class MangoLabel: FruitLabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .mango
        setting()
    }
}
