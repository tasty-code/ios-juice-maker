//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

final class InventoryViewController: UIViewController {
    
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
    
    @IBAction func modifyFruitStepper(_ sender: UIStepper) {
        updateFruitQuantity(sender)
    }
    
    private func configureUI() {
        for (fruit, component) in componentsByFruit {
            component.label.text = String(fruitStore.fruitContainer[fruit, default: 0])
            component.stepper.value = Double(fruitStore.fruitContainer[fruit, default: 0])
        }
    }
    
    private func updateFruitQuantity(_ stepper: UIStepper) {
        labelsByStepper[stepper]?.text = String(Int(stepper.value))
    }
}
