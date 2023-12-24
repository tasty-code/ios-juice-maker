//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

final class InventoryViewController: UIViewController {
    
    // MARK: @IBOutlet
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
    
    // MARK: Properties
    private let fruitStore: FruitStore
    private lazy var componentsByFruit: [Fruit: (label: UILabel, stepper: UIStepper)] = [
        .strawberry: (strawberryQuantityLabel, strawberryStepper),
        .banana: (bananaQuantityLabel, bananaStepper),
        .pineapple: (pineappleQuantityLabel, pineappleStepper),
        .kiwi: (kiwiQuantityLabel, kiwiStepper),
        .mango: (mangoQuantityLabel, mangoStepper)
    ]
    
    private lazy var fruitElementsByStepper: [UIStepper: (label: UILabel, fruit: Fruit)] = [
        strawberryStepper: (strawberryQuantityLabel, .strawberry),
        bananaStepper: (bananaQuantityLabel, .banana),
        pineappleStepper: (pineappleQuantityLabel, .pineapple),
        kiwiStepper: (kiwiQuantityLabel, .kiwi),
        mangoStepper: (mangoQuantityLabel, .mango)
    ]
    
    init?(coder aDecoder: NSCoder, fruitStore: FruitStore) {
        self.fruitStore = fruitStore
        super.init(coder: aDecoder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @IBAction private func tapCloseInventoryButton(_ sender: UIButton) {
        guard let presentingViewController = presentingViewController as? OrderViewController else {
            return
        }
        let fruitInventory = fruitStore.checkFruitContainer()
        presentingViewController.setUpFruitContainer(data: fruitInventory)
        self.dismiss(animated: true)
    }
    
    @IBAction private func tapStepper(_ sender: UIStepper) {
        guard let fruit = fruitElementsByStepper[sender]?.fruit else {
            return
        }
        updateFruitQuantity(sender, fruit)
    }
}

// MARK: - Custom Methods
extension InventoryViewController {
    
    private func configureUI() {
        for (fruit, components) in componentsByFruit {
            let fruitQuantity: Int = fruitStore.quantity(of: fruit)
            components.label.text = String(fruitQuantity)
            components.stepper.value = Double(fruitQuantity)
        }
    }
    
    private func updateFruitQuantity(_ stepper: UIStepper, _ fruit: Fruit) {
        let fruitQuantity = Int(stepper.value)
        fruitElementsByStepper[stepper]?.label.text = String(fruitQuantity)
        fruitStore.updateFruitQuantity(of: fruit, by: fruitQuantity)
    }
}
