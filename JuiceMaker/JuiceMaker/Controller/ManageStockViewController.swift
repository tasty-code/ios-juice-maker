//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import UIKit

final class ManageStockViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFruitsStock()
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        updateFruitStock()
    }
    
    private func checkFruitsStock() {
        let firstStock = fruitStore.fruitStock.compactMapValues { String($0) }
        let secondStock = fruitStore.fruitStock.compactMapValues { Double($0) }
        
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
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryStockLabel.text = String(Int(sender.value))
        case bananaStepper:
            bananaStockLabel.text = String(Int(sender.value))
        case pineappleStepper:
            pineappleStockLabel.text = String(Int(sender.value))
        case kiwiStepper:
            kiwiStockLabel.text = String(Int(sender.value))
        case mangoStepper:
            mangoStockLabel.text = String(Int(sender.value))
        default:
            break
        }
    }
    
    private func updateFruitStock() {
        fruitStore.fruitStock[.strawberry] = UInt(strawberryStockLabel.text ?? "")
        fruitStore.fruitStock[.banana] = UInt(bananaStockLabel.text ?? "")
        fruitStore.fruitStock[.pineapple] = UInt(pineappleStockLabel.text ?? "")
        fruitStore.fruitStock[.mango] = UInt(mangoStockLabel.text ?? "")
        fruitStore.fruitStock[.kiwi] = UInt(kiwiStockLabel.text ?? "")
    }
}
