//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Jin-Mac on 12/12/23.
//

import UIKit

final class FruitStockViewController: UIViewController {
    
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
        if let strawberryInitValue = FruitStore.shared.fruitStock[.strawberry],
           let bananaInitValue = FruitStore.shared.fruitStock[.banana],
           let pineappleInitValue = FruitStore.shared.fruitStock[.pineapple],
           let mangoInitValue = FruitStore.shared.fruitStock[.mango],
           let kiwiInitValue = FruitStore.shared.fruitStock[.kiwi] {
            strawberryStepper.value = Double(strawberryInitValue)
            bananaStepper.value = Double(bananaInitValue)
            pineappleStepper.value = Double(pineappleInitValue)
            mangoStepper.value = Double(mangoInitValue)
            kiwiStepper.value = Double(kiwiInitValue)
        }
    }
    
    @IBAction func strawberryStepperPressed(_ sender: UIStepper) {
        handleFruitStepper(.strawberry, value: Int(sender.value))
        updateFruitLabels()
    }
    
    @IBAction func bananaStepperPressed(_ sender: UIStepper) {
        handleFruitStepper(.banana, value: Int(sender.value))
        updateFruitLabels()
    }
    @IBAction func pineappleStepperPressed(_ sender: UIStepper) {
        handleFruitStepper(.pineapple, value: Int(sender.value))
        updateFruitLabels()
    }
    @IBAction func kiwiStepperPressed(_ sender: UIStepper) {
        handleFruitStepper(.kiwi, value: Int(sender.value))
        updateFruitLabels()
    }
    @IBAction func mangoStepperPressed(_ sender: UIStepper) {
        handleFruitStepper(.mango, value: Int(sender.value))
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
