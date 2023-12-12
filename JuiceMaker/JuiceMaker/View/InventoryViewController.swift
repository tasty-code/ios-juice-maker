//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

final class InventoryViewController: UIViewController {

    private let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private lazy var fruitQuantityLabels: [Fruit: UILabel] = [
        .strawberry: strawberryQuantityLabel,
        .banana: bananaQuantityLabel,
        .pineapple: pineappleQuantityLabel,
        .kiwi: kiwiQuantityLabel,
        .mango: mangoQuantityLabel
    ]
    
    private lazy var fruitSteppers: [UIStepper: Fruit] = [
        strawberryStepper: .strawberry,
        bananaStepper: .banana,
        pineappleStepper: .pineapple,
        kiwiStepper: .kiwi,
        mangoStepper: .mango
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureInitialStepperValue()
    }
    
    @IBAction func modifyFruitStepper(_ sender: UIStepper) {
        if let fruit = fruitSteppers[sender] {
            fruitStore.fruitContainer[fruit] = Int(sender.value)
            fruitQuantityLabels[fruit]?.text = String(format: "%.0f", sender.value)
        }
    }
    
    private func configureUI() {
        for (fruit, label) in fruitQuantityLabels {
            label.text = String(fruitStore.fruitContainer[fruit, default: 0])
        }
    }
    
    private func configureInitialStepperValue() {
        for (stepper, fruit) in fruitSteppers {
            stepper.value = Double(fruitStore.fruitContainer[fruit, default: 0])
        }
    }
}
