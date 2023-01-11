//
//  JuiceMaker - StoreViewController.swift
//
//  Created by J.E on 2023/01/06.
//

import UIKit

protocol StoreDelegate: AnyObject {
    func syncFruitStocks()
}

final class StoreViewController: UIViewController, StoreDelegate {
    private let fruitStore = FruitStore.shared
    weak var delegate: StoreDelegate?
    
    @IBOutlet private var fruitStockLabels: [UILabel]!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncFruitStocks()
        fruitStore.storeDelegate = self
    }
    
    @IBAction private func stockStepperDidTap(_ sender: UIStepper) {
        guard let stepper = fruitStockSteppers[safe: sender.tag] else { return }
        guard let fruit = Fruits.allCases[safe: stepper.tag] else { return }
        fruitStore.update(fruit, count: Int(stepper.value))
    }
    
    @IBAction private func closeButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func syncFruitStocks() {
        Fruits.allCases.enumerated().forEach {
            let stock = fruitStore.count(of: $0.1)
            guard let label = fruitStockLabels[safe: $0.0] else { return }
            guard let stepper = fruitStockSteppers[safe: $0.0] else { return }
            label.text = String(stock)
            stepper.value = Double(stock)
        }
    }
}
