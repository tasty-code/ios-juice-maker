//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/19.
//

import UIKit

final class StockManagerViewController: UIViewController {
    
    // MARK: - Properties
    
    var fruitStock: [Fruit : Int]!
    var stockEditionDelegate: StockEditDelegate!
    
    @IBOutlet private var strawberryQuantityStepper: StrawberryQuantityStepper!
    @IBOutlet private var bananaQuantityStepper: BananaQuantityStepper!
    @IBOutlet private var pineappleQuantityStepper: PineappleQuantityStepper!
    @IBOutlet private var kiwiQuantityStepper: KiwiQuantityStepper!
    @IBOutlet private var mangoQuantityStepper: MangoQuantityStepper!
    
    @IBOutlet private var strawberryQuantityLabel: StrawberryQuantityLabel!
    @IBOutlet private var bananaQuantityLabel: BananaQuantityLabel!
    @IBOutlet private var pineappleQuantityLabel: PineappleQuantityLabel!
    @IBOutlet private var kiwiQuantityLabel: KiwiQuantityLabel!
    @IBOutlet private var mangoQuantityLabel: MangoQuantityLabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStepperValue()
        displayQuantityLabel()
    }
    
    // MARK: - Methods
    
    private func initStepperValue() {
        let fruitQuantitySteppers: [FruitQuantityStepper] = [strawberryQuantityStepper,
                                                             bananaQuantityStepper,
                                                             pineappleQuantityStepper,
                                                             kiwiQuantityStepper,
                                                             mangoQuantityStepper]
        
        for stepper in fruitQuantitySteppers {
            guard let fruit = stepper.fruit() else { continue }
            guard let fruitQuantity = fruitStock[fruit] else { continue }
            stepper.value = Double(fruitQuantity)
        }
    }
    
    @IBAction private func pressCloseButton(_ sender: UIBarButtonItem) {
        stockEditionDelegate.sendChangedStock(fruitStock)
        dismiss(animated: true)
    }
    
    private func displayQuantityLabel() {
        let fruitQuantityLabels: [FruitQuantityLabel] = [strawberryQuantityLabel,
                                                         bananaQuantityLabel,
                                                         pineappleQuantityLabel,
                                                         kiwiQuantityLabel,
                                                         mangoQuantityLabel]
        
        for label in fruitQuantityLabels {
            guard let fruit = label.fruit() else { continue }
            guard let fruitQuantity = fruitStock[fruit] else { continue }
            label.text = String(fruitQuantity)
        }
    }
    
    @IBAction private func pressStepper(_ sender: FruitQuantityStepper) {
        let fruit = sender.fruit()!
        fruitStock[fruit] = Int(sender.value)
        displayQuantityLabel()
    }
    
}
