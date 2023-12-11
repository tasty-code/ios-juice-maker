//
//  FruitsStockViewController.swift
//  JuiceMaker
//
//  Created by Kyle& L
//

import UIKit

// 프로토콜 정의
protocol FruitStockDelegate: AnyObject {
    func updateFruitStock(fruit: Fruits, count: Int)
}


class FruitStoreViewController: UIViewController {
    
    var juiceMaker = JuiceMaker()
    
    weak var delegate: FruitStockDelegate?
    
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
    
    var strawberryStock: String = ""
    var bananaStock: String = ""
    var pineappleStock: String = ""
    var kiwiStock: String = ""
    var mangoStock: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        strawberryStockLabel.text = strawberryStock
        bananaStockLabel.text = bananaStock
        pineappleStockLabel.text = pineappleStock
        kiwiStockLabel.text = kiwiStock
        mangoStockLabel.text = mangoStock
        
        strawberryStepper.value = Double(juiceMaker.fruitStore.fruitStocks[.strawberry] ?? 0)
        bananaStepper.value = Double(juiceMaker.fruitStore.fruitStocks[.banana] ?? 0)
        pineappleStepper.value = Double(juiceMaker.fruitStore.fruitStocks[.pineapple] ?? 0)
        kiwiStepper.value = Double(juiceMaker.fruitStore.fruitStocks[.kiwi] ?? 0)
        mangoStepper.value = Double(juiceMaker.fruitStore.fruitStocks[.mango] ?? 0)
        
    }
    
    @IBAction func fruitsStockStepperTapped(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryStockLabel.text = String(Int(sender.value))
            delegate?.updateFruitStock(fruit: .strawberry, count: Int(sender.value))
        case bananaStepper:
            bananaStockLabel.text = String(Int(sender.value))
            delegate?.updateFruitStock(fruit: .banana, count: Int(sender.value))
        case pineappleStepper:
            pineappleStockLabel.text = String(Int(sender.value))
            delegate?.updateFruitStock(fruit: .pineapple, count: Int(sender.value))
        case kiwiStepper:
            kiwiStockLabel.text = String(Int(sender.value))
            delegate?.updateFruitStock(fruit: .kiwi, count: Int(sender.value))
        case mangoStepper:
            mangoStockLabel.text = String(Int(sender.value))
            delegate?.updateFruitStock(fruit: .mango, count: Int(sender.value))
        default:
            print("error")
        }
    }
}
