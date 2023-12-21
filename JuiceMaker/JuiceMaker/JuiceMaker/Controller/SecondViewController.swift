//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 박찬호 on 12/7/23.
//


import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didUpdateFruitStock()
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    weak var delegate: SecondViewControllerDelegate?
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStockDisplay()
    }
    
    func setupStockDisplay() {
        fruitStockDisplay(fruit: .strawberry, label: strawberryStockLabel, stepper: strawberryStockStepper)
        fruitStockDisplay(fruit: .banana, label: bananaStockLabel, stepper: bananaStockStepper)
        fruitStockDisplay(fruit: .kiwi, label: kiwiStockLabel, stepper: kiwiStockStepper)
        fruitStockDisplay(fruit: .mango, label: mangoStockLabel, stepper: mangoStockStepper)
        fruitStockDisplay(fruit: .pineapple, label: pineappleStockLabel, stepper: pineappleStockStepper)
    }
    
    func fruitStockDisplay(fruit: Fruit, label: UILabel, stepper: UIStepper) {
        guard let quantity = juiceMaker?.fruitStore.getQuantity(of: fruit) else {
            label.text = "N/A"
            stepper.isEnabled = false
            return
        }
        label.text = "\(quantity)"
        stepper.value = Double(quantity)
        stepper.minimumValue = 0
        stepper.maximumValue = 100
    }
    
    @IBAction func strawberryStepperChanged(_ sender: UIStepper) {
        updateFruitStock(fruit: .strawberry, newValue: Int(sender.value))
    }
    @IBAction func bananaStepperChanged(_ sender: UIStepper) {
        updateFruitStock(fruit: .banana, newValue: Int(sender.value))
    }
    @IBAction func pineappleStepperChanged(_ sender: UIStepper) {
        updateFruitStock(fruit: .pineapple, newValue: Int(sender.value))
    }
    @IBAction func kiwiStepperChanged(_ sender: UIStepper) {
        updateFruitStock(fruit: .kiwi, newValue: Int(sender.value))
    }
    @IBAction func mangoStepperChanged(_ sender: UIStepper) {
        updateFruitStock(fruit: .mango, newValue: Int(sender.value))
    }
    
    
    
    
    func updateFruitStock(fruit: Fruit, newValue: Int) {
        juiceMaker?.fruitStore.setQuantity(of: fruit, to: newValue)
        updateLabel(for: fruit, with: newValue)
    }
    
    func updateLabel(for fruit: Fruit, with quantity: Int ) {
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = "\(quantity)"
        case .banana:
            bananaStockLabel.text = "\(quantity)"
        case .kiwi:
            kiwiStockLabel.text = "\(quantity)"
        case .mango:
            mangoStockLabel.text = "\(quantity)"
        case .pineapple:
            pineappleStockLabel.text = "\(quantity)"
        default:
            break
        }
    }
    
    
    @IBAction func completeButton(_ sender: UIBarButtonItem) {
        delegate?.didUpdateFruitStock()
        dismiss(animated: true, completion: nil)
    }
    
}
