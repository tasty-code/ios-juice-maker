//
//  QuantityVC.swift
//  JuiceMaker
//
//  Created by 권태호 on 12/12/2023.
//

import UIKit

protocol QuantityVCDelegate: AnyObject {
    func updateFruitLabels()
}

class QuantityVC: UIViewController {
    
    var fruitStore: FruitStore?
    
    weak var delegate: QuantityVCDelegate?
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mago: UILabel!
    
    func updateFruitLabels() {
        strawberry.text = "\(fruitStore?.fruitInventory["딸기"] ?? 0)"
        banana.text = "\(fruitStore?.fruitInventory["바나나"] ?? 0)"
        pineapple.text = "\(fruitStore?.fruitInventory["파인애플"] ?? 0)"
        kiwi.text = "\(fruitStore?.fruitInventory["키위"] ?? 0)"
        mago.text = "\(fruitStore?.fruitInventory["망고"] ?? 0)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
        delegate?.updateFruitLabels()
    }

    @IBAction func strawberryStepper(_ sender: UIStepper) {
        if let fruitStore = fruitStore {
            fruitStore.fruitInventory["딸기"] = Int(sender.value)
            delegate?.updateFruitLabels()
            updateFruitLabels()
        }
    }

    @IBAction func bananaStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["바나나"] = Int(sender.value)
        updateFruitLabels()
        delegate?.updateFruitLabels()
    }
    @IBAction func pinappleStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["파인애플"] = Int(sender.value)
        updateFruitLabels()
        delegate?.updateFruitLabels()
    }
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["키위"] = Int(sender.value)
        updateFruitLabels()
        delegate?.updateFruitLabels()
    }
    @IBAction func mangoStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["망고"] = Int(sender.value)
        updateFruitLabels()
        delegate?.updateFruitLabels()
    }
}
