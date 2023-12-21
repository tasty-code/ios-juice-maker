//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Jin-Mac on 12/12/23.
//

import UIKit

class FruitStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
        initializeStepper()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: .update, object: nil)
    }
    
    private func initializeStepper() {
        if let strawberryInitValue = FruitStore.shared.fruitStock[.strawberry] { strawberryStepper.value = Double(strawberryInitValue) }
        if let bananaInitValue = FruitStore.shared.fruitStock[.banana] { bananaStepper.value = Double(bananaInitValue) }
        if let pineappleInitValue = FruitStore.shared.fruitStock[.pineapple] { pineappleStepper.value = Double(pineappleInitValue) }
        if let mangoInitValue = FruitStore.shared.fruitStock[.mango] { mangoStepper.value = Double(mangoInitValue) }
        if let kiwiInitValue = FruitStore.shared.fruitStock[.kiwi] { kiwiStepper.value = Double(kiwiInitValue) }
    }
    
    @IBAction private func stepperPressed(_ sender: UIStepper) {
        let value = Int(sender.value)
        switch sender {
        case strawberryStepper:
            handleFruitStepper(.strawberry, value: value)
        case bananaStepper:
            handleFruitStepper(.banana, value: value)
        case pineappleStepper:
            handleFruitStepper(.pineapple, value: value)
        case kiwiStepper:
            handleFruitStepper(.kiwi, value: value)
        case mangoStepper:
            handleFruitStepper(.mango, value: value)
        default:
            break
        }
        updateFruitLabels()
    }
    
    private func handleFruitStepper(_ fruit: Fruits, value: Int) {
        let difference = value - FruitStore.shared.quantity(of: fruit)
        FruitStore.shared.changeStock(fruitName: fruit, amount: difference)
    }
    
    private func updateFruitLabels() {
        if let strawberryStock = FruitStore.shared.fruitStock[.strawberry],
           let bananaStock = FruitStore.shared.fruitStock[.banana],
           let pineappleStock = FruitStore.shared.fruitStock[.pineapple],
           let kiwiStock = FruitStore.shared.fruitStock[.kiwi],
           let mangoStock = FruitStore.shared.fruitStock[.mango] {
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
            pineappleStockLabel.text = String(pineappleStock)
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
        }
    }
    
    @IBAction func closedStockViewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
