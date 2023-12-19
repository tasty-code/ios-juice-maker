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
        
        setInitStepperValue()
        reloadFruitsCount()
    }
    
    @IBAction func strawberryStepperTapped(_ sender: UIStepper) {
        
    }
    
    @IBAction func bananaStepperTapped(_ sender: UIStepper) {
        
    }
    
    @IBAction func pineappleStepperTapped(_ sender: UIStepper) {
        
    }
    
    @IBAction func kiwiStepperTapped(_ sender: UIStepper) {
        
    }
    
    @IBAction func mangoStepperTapped(_ sender: UIStepper) {
        
    }
    
    private func setInitStepperValue() {
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