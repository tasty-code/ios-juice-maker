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
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    weak var sendFruitQuantityDelegate: SendFruitQuantityDelegate?
    
    private var fruitQuantity = [FruitName: Int]()
    
    private func setInitialStepperValues() {
        setStepperValue(for: .strawberry, to: fruitQuantity[.strawberry] ?? 0)
        setStepperValue(for: .banana, to: fruitQuantity[.banana] ?? 0)
        setStepperValue(for: .pineapple, to: fruitQuantity[.pineapple] ?? 0)
        setStepperValue(for: .kiwi, to: fruitQuantity[.kiwi] ?? 0)
        setStepperValue(for: .mango, to: fruitQuantity[.mango] ?? 0)
    }
    
    private func setStepperValue(for fruit: FruitName, to value: Int) {
        switch fruit {
        case .strawberry:
            strawberryStepper.value = Double(value)
        case .banana:
            bananaStepper.value = Double(value)
        case .pineapple:
            pineappleStepper.value = Double(value)
        case .kiwi:
            kiwiStepper.value = Double(value)
        case .mango:
            mangoStepper.value = Double(value)
        }
    }
    
    private func updateFruitQuantity(_ fruit: FruitName, with quantity: Int) {
        fruitQuantity[fruit] = quantity
        updateFruitLabel(fruitName: fruit, quantity: quantity)
    }
    
    private func updateFruitQuantityLabels() {
        
        updateFruitLabel(fruitName: .strawberry, quantity: fruitQuantity[.strawberry])
        updateFruitLabel(fruitName: .banana, quantity: fruitQuantity[.banana])
        updateFruitLabel(fruitName: .pineapple, quantity: fruitQuantity[.pineapple])
        updateFruitLabel(fruitName: .kiwi, quantity: fruitQuantity[.kiwi])
        updateFruitLabel(fruitName: .mango, quantity: fruitQuantity[.mango])
    }
    
    private func updateFruitLabel(fruitName: FruitName, quantity: Int?) {
        guard let fruitQuantity = quantity else {
            return
        }
        
        switch fruitName {
        case .strawberry:
            strawberryQuantityLabel.text = String(fruitQuantity)
        case .banana:
            bananaQuantityLabel.text = String(fruitQuantity)
        case .pineapple:
            pineappleQuantityLabel.text = String(fruitQuantity)
        case .kiwi:
            kiwiQuantityLabel.text = String(fruitQuantity)
        case .mango:
            mangoQuantitylabel.text = String(fruitQuantity)
        }
    }
    
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
    
    @IBAction func fruitStepperValueChanged(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            updateFruitQuantity(.strawberry, with: Int(sender.value))
        case 1:
            updateFruitQuantity(.banana, with: Int(sender.value))
        case 2:
            updateFruitQuantity(.pineapple, with: Int(sender.value))
        case 3:
            updateFruitQuantity(.kiwi, with: Int(sender.value))
        case 4:
            updateFruitQuantity(.mango, with: Int(sender.value))
        default:
            break
        }
    }
}

extension ModifyInventoryViewController: SendFruitQuantityDelegate {
    func sendFruitQuantityData(fruitQuantity: [FruitName : Int]) {
        self.fruitQuantity = fruitQuantity
    }
}
