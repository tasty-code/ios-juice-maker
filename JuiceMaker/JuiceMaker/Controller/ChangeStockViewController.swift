//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by 신동오 on 2023/01/09.
//

import UIKit

class ChangeStockViewController: UIViewController {
    var vcon: ViewController? = nil
    
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
        setup()
    }
    
    func setup() {
        guard let strawberry = FruitStore.shared.fruitStock[.strawberry],
              let banana = FruitStore.shared.fruitStock[.banana],
              let pineapple = FruitStore.shared.fruitStock[.pineapple],
              let mango = FruitStore.shared.fruitStock[.mango],
              let kiwi = FruitStore.shared.fruitStock[.kiwi]
        else { return }
        
        strawberryLabel.text = String(Int(strawberry))
        bananaLabel.text = String(Int(banana))
        pineappleLabel.text = String(Int(pineapple))
        mangoLabel.text = String(Int(mango))
        kiwiLabel.text = String(Int(kiwi))
        
        strawberryStepper.value = Double(strawberry)
        bananaStepper.value = Double(banana)
        pineappleStepper.value = Double(pineapple)
        mangoStepper.value = Double(mango)
        kiwiStepper.value = Double(kiwi)
    }
    
    @IBAction func strawberryStepperTapped(_ sender: UIStepper) {
        strawberryLabel.text = String(Int(strawberryStepper.value))
    }
    
    @IBAction func bananaStepperTapped(_ sender: UIStepper) {
        bananaLabel.text = String(Int(bananaStepper.value))
    }
    
    @IBAction func pineappleStepperTapped(_ sender: UIStepper) {
        pineappleLabel.text = String(Int(pineappleStepper.value))
    }
    
    @IBAction func kiwiStepperTapped(_ sender: UIStepper) {
        kiwiLabel.text = String(Int(kiwiStepper.value))
    }
    
    @IBAction func mangoStepperTapped(_ sender: UIStepper) {
        mangoLabel.text = String(Int(mangoStepper.value))
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        FruitStore.shared.changeQuantity(of: .strawberry, num: UInt(strawberryStepper.value))
        FruitStore.shared.changeQuantity(of: .banana, num: UInt(bananaStepper.value))
        FruitStore.shared.changeQuantity(of: .pineapple, num: UInt(pineappleStepper.value))
        FruitStore.shared.changeQuantity(of: .kiwi, num: UInt(kiwiStepper.value))
        FruitStore.shared.changeQuantity(of: .mango, num: UInt(mangoStepper.value))
        
        vcon?.refreshLabels()
        
        self.presentingViewController?.dismiss(animated: true)
    }
}
