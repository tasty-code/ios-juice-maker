//
//  AdjustStockViewController.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/15.
//

import UIKit

protocol InventorySendDelegate: AnyObject {
    func sendInventory(inventory: [FruitName: Int])
}

final class AdjustStockViewController: UIViewController {
    @IBOutlet private var fruitStockLabels: [UILabel]!
    
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    
    var inventory: [FruitName: Int]?
    
    weak var delegate: InventorySendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncStockLabels()
        syncStepperValue()
    }
    
    @IBAction private func touchFruitStockStepper(_ sender: UIStepper) {
        guard let fruit = sender as? FruitStockIdentifiable else { return }
        inventory?[fruit.fruitType] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction private func touchNavSaveButton(_ sender: UIButton) {
        if let inventory = inventory {
            delegate?.sendInventory(inventory: inventory)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Private Methods
extension AdjustStockViewController {
    private func syncStockLabels() {
        for fruitStockLabel in fruitStockLabels {
            guard let label = fruitStockLabel as? FruitStockIdentifiable,
                  let stock = inventory?[label.fruitType]
            else { return }
            
            fruitStockLabel.text = String(stock)
        }
    }
    
    private func syncStepperValue() {
        for fruitStockStepper in fruitStockSteppers {
            guard let stepper = fruitStockStepper as? FruitStockIdentifiable,
                  let value = inventory?[stepper.fruitType]
            else { return }
            
            fruitStockStepper.value = Double(value)
        }
    }
}
