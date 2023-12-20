//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이보한 on 2023/12/19.
//

import UIKit

final class StockViewController: UIViewController {
    
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
    
    let fruitStore = FruitStore.shared
    
    private lazy var fruitsLabel: [String: UILabel] = [
        Fruit.strawberry.rawValue : strawberryLabel,
        Fruit.banana.rawValue : bananaLabel,
        Fruit.pineapple.rawValue : pineappleLabel,
        Fruit.kiwi.rawValue : kiwiLabel,
        Fruit.mango.rawValue : mangoLabel
    ]
    private lazy var fruitsStepper: [String: UIStepper] = [
        Fruit.strawberry.rawValue : strawberryStepper,
        Fruit.banana.rawValue : bananaStepper,
        Fruit.pineapple.rawValue : pineappleStepper,
        Fruit.kiwi.rawValue : kiwiStepper,
        Fruit.mango.rawValue : mangoStepper
    ]
    
    @IBAction func btnCloseStockView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        self.fruitsLabel.forEach { fruit, uiLabel in
            guard let fruitValue = self.fruitStore.fruits[fruit],
                  let fruitStepper = fruitsStepper[fruit]
                    
            else {
                return
            }
            uiLabel.text = String(fruitValue)
            fruitStepper.value = Double(fruitValue)
            fruitStepper.minimumValue = 0
        }
    }
    
    @IBAction func onClickStepper(_ sender: UIStepper) {
        var selectedFruit : Fruit?
        switch sender.tag {
        case 0:
            selectedFruit = Fruit.strawberry
        case 1: 
            selectedFruit = Fruit.banana
        case 2:
            selectedFruit = Fruit.pineapple
        case 3:
            selectedFruit = Fruit.kiwi
        case 4:
            selectedFruit = Fruit.mango
        default:
            break
        }
        guard let selectedFruit,
        let setTextView = fruitsLabel[selectedFruit.rawValue]
        else {
            return
        }
        let intSender = Int(sender.value)
        setTextView.text = String(intSender)
    }
}
