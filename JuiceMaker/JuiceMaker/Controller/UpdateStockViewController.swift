//
//  AddStockViewController.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/12.
//

import UIKit

final class UpdateStockViewController: UIViewController {
    var fruitStore: FruitStore!

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


    @IBAction private func strawberryStepperButton(_ sender: UIStepper) {
        strawberryStockLabel.text = String(format: "%.0f",strawberryStepper.value)
    }

    @IBAction private func bananaStepperButton(_ sender: UIStepper) {
        bananaStockLabel.text = String(format: "%.0f", bananaStepper.value)
    }

    @IBAction private func pineappleStepperButton(_ sender: UIStepper) {
        pineappleStockLabel.text = String(format: "%.0f", pineappleStepper.value)
    }

    @IBAction private func kiwiStepperButton(_ sender: UIStepper) {
        kiwiStockLabel.text = String(format: "%.0f", kiwiStepper.value)
    }

    @IBAction private func mangoStepperButton(_ sender: UIStepper) {
        mangoStockLabel.text = String(format: "%.0f", mangoStepper.value)
    }

    @IBAction private func closeButton(_ sender: UIBarButtonItem) {
        fruitStore.updateStock(fruit: .strawberry, count: UInt(strawberryStepper.value))
        fruitStore.updateStock(fruit: .banana, count: UInt(bananaStepper.value))
        fruitStore.updateStock(fruit: .pineapple, count: UInt(pineappleStepper.value))
        fruitStore.updateStock(fruit: .kiwi, count: UInt(kiwiStepper.value))
        fruitStore.updateStock(fruit: .mango, count: UInt(mangoStepper.value))
        self.presentingViewController?.dismiss(animated: true)
        self.presentingViewController?.viewWillAppear(false)
    }
}
