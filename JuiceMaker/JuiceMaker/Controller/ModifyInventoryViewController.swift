//
//  ModifyInventoryViewController.swift
//  JuiceMaker
//
//  Created by Taewan Kim on 12/12/23.
//

import UIKit

class ModifyInventoryViewController: UIViewController {
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantitylabel: UILabel!
    @IBOutlet var fruitquantityLabels: [UILabel]!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    weak var sendFruitQuantityDelegate: SendFruitQuantityDelegate?
    
    private var fruitQuantity = [FruitName: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateFruitQuantityLabels()
        setInitialStepperValues()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.sendFruitQuantityDelegate?.sendFruitQuantityData(fruitQuantity: fruitQuantity)
    }
    
    private func setInitialStepperValues() {
        for (index, fruit) in FruitName.allCases.enumerated() {
            setStepperValue(for: fruit, to: fruitQuantity[fruit] ?? 0, atIndex: index)
        }
    }
    
    private func setStepperValue(for fruit: FruitName, to value: Int, atIndex index: Int) {
        fruitSteppers[index].value = Double(value)
    }
    
    private func updateFruitQuantity(_ fruit: FruitName, with quantity: Int, atIndex index: Int) {
        fruitQuantity[fruit] = quantity
        updateFruitLabel(fruitName: fruit, quantity: quantity, atIndex: index)
    }
    
    private func updateFruitQuantityLabels() {
        for (index, fruit) in FruitName.allCases.enumerated() {
            updateFruitLabel(fruitName: fruit, quantity: fruitQuantity[fruit], atIndex: index)
        }
    }
    
    private func updateFruitLabel(fruitName: FruitName, quantity: Int?, atIndex index: Int) {
        guard let fruitQuantity = quantity else {
            return
        }
        fruitquantityLabels[index].text = String(fruitQuantity)
    }
    
    
    @IBAction func fruitStepperValueChanged(_ sender: UIStepper) {
        guard let index = fruitSteppers.firstIndex(of: sender) else {
            return
        }
        let fruit = FruitName.allCases[index]
        updateFruitQuantity(fruit, with: Int(sender.value), atIndex: index)
    }
}

extension ModifyInventoryViewController: SendFruitQuantityDelegate {
    func sendFruitQuantityData(fruitQuantity: [FruitName : Int]) {
        self.fruitQuantity = fruitQuantity
    }
}
