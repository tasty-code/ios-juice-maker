//
//  SupplyViewController.swift
//  JuiceMaker
//
//

import UIKit

class SupplyViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private let fruitStore = FruitStore.shared
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        setInitialStepperValue()
        reloadFruitsCount()
    }
    
    @IBAction func strawberryStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .strawberry, sender: sender)
    }
    
    @IBAction func bananaStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .banana, sender: sender)
    }
    
    @IBAction func pineappleStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .pineapple, sender: sender)
    }
    
    @IBAction func kiwiStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .kiwi, sender: sender)
    }
    
    @IBAction func mangoStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .mango, sender: sender)
    }
    
    private func updateStock(fruit: FruitStore.Fruit, sender: UIStepper) {
        let stepperValue = Int(sender.value)
        fruitStore.updateStock(fruit: fruit, amount: stepperValue)
        reloadFruitsCount()
    }
    
    private func setInitialStepperValue() {
        strawberryStepper.value = Double(fruitStore.storage[.strawberry] ?? 0)
        bananaStepper.value = Double(fruitStore.storage[.banana] ?? 0)
        pineappleStepper.value = Double(fruitStore.storage[.pineapple] ?? 0)
        kiwiStepper.value = Double(fruitStore.storage[.kiwi] ?? 0)
        mangoStepper.value = Double(fruitStore.storage[.mango] ?? 0)
    }
    
    private func reloadFruitsCount() {
        strawberryCountLabel.text = String(describing: fruitStore.storage[.strawberry] ?? 0)
        bananaCountLabel.text = String(describing: fruitStore.storage[.banana] ?? 0)
        pineappleCountLabel.text = String(describing: fruitStore.storage[.pineapple] ?? 0)
        kiwiCountLabel.text = String(describing: fruitStore.storage[.kiwi] ?? 0)
        mangoCountLabel.text = String(describing: fruitStore.storage[.mango] ?? 0)
    }
}
