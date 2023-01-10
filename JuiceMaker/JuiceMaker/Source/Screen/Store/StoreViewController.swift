//
//  JuiceMaker - StoreViewController.swift
//
//  Created by J.E on 2023/01/06.
//

import UIKit

final class StoreViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
    @IBOutlet private var fruitStockLabels: [UILabel]!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func stockStepperDidTap(_ sender: UIStepper) {
        guard let label = fruitStockLabels[safe: sender.tag] else { return }
        guard let stepper = fruitStockSteppers[safe: sender.tag] else { return }
        label.text = "\(Int(stepper.value))"
    }
    
    @IBAction private func confirmChangedStockButtonDidTap(_ sender: UIBarButtonItem) {
        addStocks()
        navigationController?.popViewController(animated: true)
    }
    
    private func addStocks() {
        Fruits.allCases.enumerated().forEach {
            let addedStocks = fruitStockSteppers.map { Int($0.value) }
            fruitStore.increase(of: $0.1, amount: addedStocks[safe: $0.0] ?? 0)
        }
    }
}
