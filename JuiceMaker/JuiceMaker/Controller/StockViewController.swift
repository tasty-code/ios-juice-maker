//
//  AddStockViewController.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/12.
//

import UIKit

final class StockViewController: UIViewController {
    var fruitStore = FruitStore()

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!

    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
    }

    private func initLabels() {
        let strawberryStock = fruitStore.stock(byFruit: .strawberry)
        strawberryStockLabel.text = String(strawberryStock)
        strawberryStepper.value = Double(strawberryStock)

        let bananaStock = fruitStore.stock(byFruit: .banana)
        bananaStockLabel.text = String(bananaStock)
        bananaStepper.value = Double(bananaStock)

        let pineappleStock = fruitStore.stock(byFruit: .pineapple)
        pineappleStockLabel.text = String(pineappleStock)
        pineappleStepper.value = Double(pineappleStock)

        let kiwiStock = fruitStore.stock(byFruit: .kiwi)
        kiwiStockLabel.text = String(kiwiStock)
        kiwiStepper.value = Double(kiwiStock)

        let mangoStock = fruitStore.stock(byFruit: .mango)
        mangoStockLabel.text = String(mangoStock)
        mangoStepper.value = Double(mangoStock)
    }

    @IBAction private func strawberryStepperDidTap(_ sender: UIStepper) {
        fruitStore.updateStock(fruit: .strawberry, count: UInt(strawberryStepper.value))
        strawberryStockLabel.text = String(fruitStore.stock(byFruit: .strawberry))
    }

    @IBAction private func bananaStepperDidTap(_ sender: UIStepper) {
        fruitStore.updateStock(fruit: .banana, count: UInt(bananaStepper.value))
        bananaStockLabel.text = String(fruitStore.stock(byFruit: .banana))
    }

    @IBAction func pineappleStepperDidTap(_ sender: UIStepper) {
        fruitStore.updateStock(fruit: .pineapple, count: UInt(pineappleStepper.value))
        pineappleStockLabel.text = String(fruitStore.stock(byFruit: .pineapple))
    }

    @IBAction private func kiwiStepperDidTap(_ sender: UIStepper) {
        fruitStore.updateStock(fruit: .kiwi, count: UInt(kiwiStepper.value))
        kiwiStockLabel.text = String(fruitStore.stock(byFruit: .kiwi))
    }

    @IBAction private func mangoStepperDidTap(_ sender: UIStepper) {
        fruitStore.updateStock(fruit: .mango, count: UInt(mangoStepper.value))
        mangoStockLabel.text = String(fruitStore.stock(byFruit: .mango))
    }

    @IBAction func closeButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
