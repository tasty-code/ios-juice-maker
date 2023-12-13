//
//  QuantityVC.swift
//  JuiceMaker
//
//  Created by 권태호 on 12/12/2023.
//

import UIKit

class QuantityVC: UIViewController {
    
    let fruitStore = FruitStore.shared
    
    weak var delegate: FruitStoreDelegate?
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mago: UILabel!
    
    func updateFruitLabels() {
        if let strawberryQuantity = fruitStore.fruitInventory["딸기"] {
            strawberry.text = String(strawberryQuantity)
        }
        if let bananaQuantity = fruitStore.fruitInventory["바나나"] {
            banana.text = String(bananaQuantity)
        }
        if let pineAppleQuantity = fruitStore.fruitInventory["파인애플"] {
            pineapple.text = String(pineAppleQuantity)
        }
        if let kiwiQuantity = fruitStore.fruitInventory["키위"] {
            kiwi.text = String(kiwiQuantity)
        }
        if let mangoQuantity = fruitStore.fruitInventory["망고"] {
            mago.text = String(mangoQuantity)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
    }
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        fruitStore.fruitInventory["딸기"] = Int(sender.value)
        updateFruitLabels()
        delegate?.didUpdateFruitInventory()
    }

    @IBAction func bananaStepper(_ sender: UIStepper) {
        fruitStore.fruitInventory["바나나"] = Int(sender.value)
        updateFruitLabels()
        delegate?.didUpdateFruitInventory()
    }
    @IBAction func pinappleStepper(_ sender: UIStepper) {
        fruitStore.fruitInventory["파인애플"] = Int(sender.value)
        updateFruitLabels()
        delegate?.didUpdateFruitInventory()
    }
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        fruitStore.fruitInventory["키위"] = Int(sender.value)
        updateFruitLabels()
        delegate?.didUpdateFruitInventory()
    }
    @IBAction func mangoStepper(_ sender: UIStepper) {
        fruitStore.fruitInventory["망고"] = Int(sender.value)
        updateFruitLabels()
        delegate?.didUpdateFruitInventory()
    }
}
