//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import UIKit

final class ManageStockViewController: UIViewController {
    var fruitStock: [Fruit: UInt] = [:]
    weak var delegate: Delegate?
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        configureUI()
    }
    
    @IBAction private func closedTapped(_ sender: UIBarButtonItem) {
        
        delegate?.fruitStock(fruitStock: fruitStock)
        
        self.dismiss(animated: true)
    }
    
    private func configureUI() {
        let firstStock = fruitStock.compactMapValues { String($0) }
        let secondStock = fruitStock.compactMapValues { Double($0) }
        
        strawberryStockLabel.text = firstStock[.strawberry]
        strawberryStepper.value = secondStock[.strawberry] ?? 0
        bananaStockLabel.text = firstStock[.banana]
        bananaStepper.value = secondStock[.banana] ?? 0
        pineappleStockLabel.text = firstStock[.pineapple]
        pineappleStepper.value = secondStock[.pineapple] ?? 0
        kiwiStockLabel.text = firstStock[.kiwi]
        kiwiStepper.value = secondStock[.kiwi] ?? 0
        mangoStockLabel.text = firstStock[.mango]
        mangoStepper.value = secondStock[.mango] ?? 0
    }
    
    @IBAction private func stepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            fruitStock[.strawberry] = UInt(sender.value)
        case bananaStepper:
            fruitStock[.banana] = UInt(sender.value)
        case pineappleStepper:
            fruitStock[.pineapple] = UInt(sender.value)
        case kiwiStepper:
            fruitStock[.kiwi] = UInt(sender.value)
        case mangoStepper:
            fruitStock[.mango] = UInt(sender.value)
        default:
            break
        }
        
        configureUI()
    }
}
