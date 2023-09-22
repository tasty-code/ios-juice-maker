//
//  DashboardViewController.swift
//  JuiceMaker
//
//  Created by JaeHyeok Sim on 2023/09/18.
//

import UIKit

protocol DashboardViewControllerDelegate: AnyObject {
    func didUpdateData()
}

final class DashboardViewController: UIViewController {
    weak var delegate: DashboardViewControllerDelegate?
    var juiceMakerModel: JuiceMaker?
    var fruitDataSet: [(Fruit, UILabel, UIStepper)]?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDataSet = [(Fruit.strawberry, strawberryLabel, strawberryStepper),(Fruit.banana, bananaLabel, bananaStepper),
                        (Fruit.pineapple, pineappleLabel, pineappleStepper),
                        (Fruit.kiwi, kiwiLabel, kiwiStepper),
                        (Fruit.mango, mangoLabel, mangoStepper)
        ]
        setStockLabel()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        delegate?.didUpdateData()
        dismiss(animated: true)
    }
    
    @IBAction private func didStepperTapped(_ sender: UIStepper) {
        guard let fruitData = fruitDataSet else {
            return
        }
        guard let juiceMaker = juiceMakerModel else {
            return
        }
        
        switch sender.tag {
        case 0:
            juiceMaker.updateFruitStock(fruit: fruitData[0].0, amount: sender.value)
            fruitData[0].1.text = Int(sender.value).description
        case 1:
            juiceMaker.updateFruitStock(fruit: fruitData[1].0, amount: sender.value)
            fruitData[1].1.text = Int(sender.value).description
        case 2:
            juiceMaker.updateFruitStock(fruit: fruitData[2].0, amount: sender.value)
            fruitData[2].1.text = Int(sender.value).description
        case 3:
            juiceMaker.updateFruitStock(fruit: fruitData[3].0, amount: sender.value)
            fruitData[3].1.text = Int(sender.value).description
        case 4:
            juiceMaker.updateFruitStock(fruit: fruitData[4].0, amount: sender.value)
            fruitData[4].1.text = Int(sender.value).description
        default:
            break
        }
    }
    
    private func setStockLabel() {
        guard let fruitData = fruitDataSet else {
            return
        }
        guard let juiceMaker = juiceMakerModel else {
            return
        }
        
        let fruitStocks = juiceMaker.getAllStocks()
        for (fruit, label, stepper) in fruitData {
            guard let amount = fruitStocks[fruit] else {
                return
            }
            label.text = String(amount)
            stepper.value = Double(amount)
        }
    }
}
