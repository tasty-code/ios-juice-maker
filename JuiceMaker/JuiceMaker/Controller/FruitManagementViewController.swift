//
//  FruitManagementController.swift
//  JuiceMaker
//
//  Created by 정연호 on 2022/08/31.
//

import UIKit

class FruitManagementViewController: UIViewController {
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
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateAllFluitLabel()
        updateStepperValue()
    }
    
    @IBAction func strawberryStepperChanged(_ sender: UIStepper) {
        setFruitQuantity(of: .strawberry, at: Int(sender.value))
    }
    
    @IBAction func bananaStepperChanged(_ sender: UIStepper) {
        setFruitQuantity(of: .banana, at: Int(sender.value))
    }
    
    @IBAction func pineappleStepperChanged(_ sender: UIStepper) {
        setFruitQuantity(of: .pineapple, at: Int(sender.value))
    }
    
    @IBAction func kiwiStepperChanged(_ sender: UIStepper) {
        setFruitQuantity(of: .kiwi, at: Int(sender.value))
    }
    
    @IBAction func mangoStepperChanged(_ sender: UIStepper) {
        setFruitQuantity(of: .mango, at: Int(sender.value))
    }
    
    func setFruitQuantity(of fruit: Fruit, at quantity: Int) {
        juiceMaker.setQuantity(of: fruit, at: quantity)
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(quantity)
        case .banana:
            bananaLabel.text = String(quantity)
        case .pineapple:
            pineappleLabel.text = String(quantity)
        case .kiwi:
            kiwiLabel.text = String(quantity)
        case .mango:
            mangoLabel.text = String(quantity)
        }
    }

    func updateAllFluitLabel() {
        strawberryLabel.text = String(self.getQuantity(of: .strawberry))
        bananaLabel.text = String(self.getQuantity(of: .banana))
        pineappleLabel.text = String(self.getQuantity(of: .pineapple))
        kiwiLabel.text = String(self.getQuantity(of: .kiwi))
        mangoLabel.text = String(self.getQuantity(of: .mango))
    }
    
    func updateStepperValue() {
        strawberryStepper.value = Double(self.getQuantity(of: .strawberry))
        bananaStepper.value = Double(self.getQuantity(of: .banana))
        pineappleStepper.value = Double(self.getQuantity(of: .pineapple))
        kiwiStepper.value = Double(self.getQuantity(of: .kiwi))
        mangoStepper.value = Double(self.getQuantity(of: .mango))
    }
    
    func getQuantity(of fruit: Fruit) -> Int {
      return (try? juiceMaker.getQuantity(of: fruit)) ?? 0
    }
}
