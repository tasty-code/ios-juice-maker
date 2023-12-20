//
//  StockViewController.swift
//  JuiceMaker
//
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    weak var delegate: StockViewControllerDelegate?
    private let fruitStore = FruitStore.shared
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        setInitialStepperValue()
        reloadFruitsCount()
    }
    
    @IBAction private func closeButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.stockViewControllerDidExit()
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction private func strawberryStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .strawberry, amount: Int(sender.value))
    }
    
    @IBAction private func bananaStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .banana, amount: Int(sender.value))
    }
    
    @IBAction private func pineappleStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .pineapple, amount: Int(sender.value))
    }
    
    @IBAction private func kiwiStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .kiwi, amount: Int(sender.value))
    }
    
    @IBAction private func mangoStepperTapped(_ sender: UIStepper) {
        updateStock(fruit: .mango, amount: Int(sender.value))
    }
    
    private func updateStock(fruit: FruitStore.Fruit, amount: Int) {
        fruitStore.updateStock(fruit: fruit, amount: amount)
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

protocol StockViewControllerDelegate: AnyObject {
    func stockViewControllerDidExit()
}
