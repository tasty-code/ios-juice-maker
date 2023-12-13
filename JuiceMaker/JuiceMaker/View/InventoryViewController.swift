//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

final class InventoryViewController: UIViewController {
    
    @IBOutlet private weak var strawberryQuantityLabel: UILabel!
    @IBOutlet private weak var bananaQuantityLabel: UILabel!
    @IBOutlet private weak var pineappleQuantityLabel: UILabel!
    @IBOutlet private weak var kiwiQuantityLabel: UILabel!
    @IBOutlet private weak var mangoQuantityLabel: UILabel!
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    private var fruitStore: FruitStore
    private lazy var componentsByFruit: [Fruit: (label: UILabel, stepper: UIStepper)] = [
        .strawberry: (strawberryQuantityLabel, strawberryStepper),
        .banana: (bananaQuantityLabel, bananaStepper),
        .pineapple: (pineappleQuantityLabel, pineappleStepper),
        .kiwi: (kiwiQuantityLabel, kiwiStepper),
        .mango: (mangoQuantityLabel, mangoStepper)
    ]
    
    private lazy var labelsByStepper: [UIStepper: UILabel] = [
        strawberryStepper: strawberryQuantityLabel,
        bananaStepper: bananaQuantityLabel,
        pineappleStepper: pineappleQuantityLabel,
        kiwiStepper: kiwiQuantityLabel,
        mangoStepper: mangoQuantityLabel
    ]
    
    required init?(coder aDecoder: NSCoder) {
        self.fruitStore = FruitStore.shared
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @IBAction private func modifyFruitStepper(_ sender: UIStepper) {
        updateFruitQuantity(sender)
    }
}

extension InventoryViewController {
    
    private func configureUI() {
        for (fruit, components) in componentsByFruit {
            components.label.text = String(fruitStore.fruitContainer[fruit, default: 0])
            components.stepper.value = Double(fruitStore.fruitContainer[fruit, default: 0])
        }
    }
    
    private func updateFruitQuantity(_ stepper: UIStepper) {
        labelsByStepper[stepper]?.text = String(Int(stepper.value))
    }
}
