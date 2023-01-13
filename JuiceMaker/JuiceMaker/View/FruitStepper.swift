//
//  FruitStepper.swift
//  JuiceMaker
//
//  Created by 송선진 on 2023/01/13.
//

import UIKit

class FruitStepper: UIStepper {
    var fruit: Fruits?

    func setting() {
        guard let fruit = self.fruit, let stock = FruitStore.shared.stock(fruit: fruit) else { return }
        value = Double(stock)
    }
}

class StrawberryStepper: FruitStepper {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .strawberry
        setting()
    }
}

class BananaStepper: FruitStepper {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .banana
        setting()
    }
}

class PineappleStepper: FruitStepper {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .pineapple
        setting()
    }
}

class KiwiStepper: FruitStepper {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .kiwi
        setting()
    }
}

class MangoStepper: FruitStepper {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.fruit = .mango
        setting()
    }
}
