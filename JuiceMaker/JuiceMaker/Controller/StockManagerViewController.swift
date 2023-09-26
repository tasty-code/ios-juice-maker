//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/19.
//

import UIKit

final class StockManagerViewController: UIViewController {

    @IBOutlet var strawberryQuantityStepper: StrawberryQuantityStepper!
    @IBOutlet var bananaQuantityStepper: BananaQuantityStepper!
    @IBOutlet var pineappleQuantityStepper: PineappleQuantityStepper!
    @IBOutlet var kiwiQuantityStepper: KiwiQuantityStepper!
    @IBOutlet var mangoQuantityStepper: MangoQuantityStepper!
    
    
    // MARK: - Properties
    
    var fruitStock: [Fruit : Int]!
    
    @IBOutlet private var strawberryQuantityLabel: StrawberryQuantityLabel!
    @IBOutlet private var bananaQuantityLabel: BananaQuantityLabel!
    @IBOutlet private var pineappleQuantityLabel: PineappleQuantityLabel!
    @IBOutlet private var kiwiQuantityLabel: KiwiQuantityLabel!
    @IBOutlet private var mangoQuantityLabel: MangoQuantityLabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryQuantityStepper.value = Double(fruitStock[Fruit.strawberry]!)
        bananaQuantityStepper.value = Double(fruitStock[Fruit.banana]!)
        pineappleQuantityStepper.value = Double(fruitStock[Fruit.pineapple]!)
        kiwiQuantityStepper.value = Double(fruitStock[Fruit.kiwi]!)
        mangoQuantityStepper.value = Double(fruitStock[Fruit.mango]!)
        
        displayQuantityLabel()
    }
    
    // MARK: - Methods
    
    @IBAction private func pressCloseButton(_ sender: UIBarButtonItem) {
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
    
    @IBAction func pressStrawberryStepper(_ sender: UIStepper) {
        // sender.value = Double(fruitStock[Fruit.strawberry]!)
        fruitStock[Fruit.strawberry] = Int(sender.value)
        strawberryQuantityLabel.text = Int(sender.value).description
    }
    
    @IBAction func pressBananaStepper(_ sender: UIStepper) {
        fruitStock[Fruit.banana] = Int(sender.value)
        bananaQuantityLabel.text = Int(sender.value).description
    }
    
    @IBAction func pressPineappleStepper(_ sender: UIStepper) {
        fruitStock[Fruit.pineapple] = Int(sender.value)
        pineappleQuantityLabel.text = Int(sender.value).description
    }
    
    @IBAction func pressKiwiStepper(_ sender: UIStepper) {
        fruitStock[Fruit.kiwi] = Int(sender.value)
        kiwiQuantityLabel.text = Int(sender.value).description
    }
    
    @IBAction func pressMangoStepper(_ sender: UIStepper) {
        fruitStock[Fruit.mango] = Int(sender.value)
        mangoQuantityLabel.text = Int(sender.value).description
    }
}
