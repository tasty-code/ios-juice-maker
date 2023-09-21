//
//  AdjustStockViewController.swift
//  JuiceMaker
//
//  Created by Swain Yun on 2023/09/15.
//

import UIKit

protocol InventorySendDelegate: AnyObject {
    func sendInventory(inventory: [String: Int])
}

class AdjustStockViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    var inventory: [String: Int]?
    weak var delegate: InventorySendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncStockLabels()
        syncStepperValue()
    }
    
    @IBAction func touchStrawberryStepper(_ sender: UIStepper) {
        inventory?["딸기"] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction func touchBananaStepper(_ sender: UIStepper) {
        inventory?["바나나"] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction func touchKiwiStepper(_ sender: UIStepper) {
        inventory?["키위"] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction func touchPineappleStepper(_ sender: UIStepper) {
        inventory?["파인애플"] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction func touchMangoStepper(_ sender: UIStepper) {
        inventory?["망고"] = Int(sender.value)
        syncStockLabels()
    }
    
    @IBAction func touchNavSaveButton(_ sender: UIButton) {
        if let inventory = inventory {
            delegate?.sendInventory(inventory: inventory)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Private Methods
extension AdjustStockViewController {
    private func syncStockLabels() {
        strawberryStockLabel.text = String(inventory?["딸기"] ?? 0)
        bananaStockLabel.text = String(inventory?["바나나"] ?? 0)
        kiwiStockLabel.text = String(inventory?["키위"] ?? 0)
        pineappleStockLabel.text = String(inventory?["파인애플"] ?? 0)
        mangoStockLabel.text = String(inventory?["망고"] ?? 0)
    }
    
    private func syncStepperValue() {
        strawberryStockStepper.value = Double(inventory?["딸기"] ?? 0)
        bananaStockStepper.value = Double(inventory?["바나나"] ?? 0)
        pineappleStockStepper.value = Double(inventory?["파인애플"] ?? 0)
        kiwiStockStepper.value = Double(inventory?["키위"] ?? 0)
        mangoStockStepper.value = Double(inventory?["망고"] ?? 0)
    }
}
