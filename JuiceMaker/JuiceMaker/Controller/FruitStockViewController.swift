//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Jin-Mac on 12/12/23.
//

import UIKit

protocol FruitStockDelegate: AnyObject {
    func didUpdateFruitStock(fruitStock: [Fruits: Int])
}

class FruitStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet var steppers: [UIStepper]!
    
    weak var delegate: FruitStockDelegate?
    var fruitStock: [Fruits: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
        initStock()
    }
    
    private func initStock() {
        if let tempValue = fruitStock[.strawberry] { strawberryStepper.value = Double(tempValue) }
        if let tempValue = fruitStock[.banana] { bananaStepper.value = Double(tempValue) }
        if let tempValue = fruitStock[.pineapple] { pineappleStepper.value = Double(tempValue) }
        if let tempValue = fruitStock[.mango] { mangoStepper.value = Double(tempValue) }
        if let tempValue = fruitStock[.kiwi] { kiwiStepper.value = Double(tempValue) }
    }
    
    @IBAction private func stepperPressed(_ sender: UIStepper) {
        let value = Int(sender.value)
        switch sender {
        case strawberryStepper:
            handleFruitStepper(.strawberry, value: value)
        case bananaStepper:
            handleFruitStepper(.banana, value: value)
        case pineappleStepper:
            handleFruitStepper(.pineapple, value: value)
        case kiwiStepper:
            handleFruitStepper(.kiwi, value: value)
        case mangoStepper:
            handleFruitStepper(.mango, value: value)
        default:
            break
        }
        
        updateFruitLabels()
    }
    
    private func handleFruitStepper(_ fruit: Fruits, value: Int) {
        fruitStock[fruit] = value
    }
    
    private func updateFruitLabels() {
        if let strawberryStock = fruitStock[.strawberry],
           let bananaStock = fruitStock[.banana],
           let pineappleStock = fruitStock[.pineapple],
           let kiwiStock = fruitStock[.kiwi],
           let mangoStock = fruitStock[.mango] {
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
            pineappleStockLabel.text = String(pineappleStock)
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
        }
    }
    
    @IBAction func closedStockViewButton(_ sender: UIBarButtonItem) {
        delegate?.didUpdateFruitStock(fruitStock: fruitStock)
        self.dismiss(animated: true, completion: nil)
    }
}
