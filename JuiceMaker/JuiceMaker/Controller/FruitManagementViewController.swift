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
        strawberryLabel.text = String((try? juiceMaker.getQuantity(of: .strawberry)) ?? 0)
        bananaLabel.text = String((try? juiceMaker.getQuantity(of: .banana)) ?? 0)
        pineappleLabel.text = String((try? juiceMaker.getQuantity(of: .pineapple)) ?? 0)
        kiwiLabel.text = String((try? juiceMaker.getQuantity(of: .kiwi)) ?? 0)
        mangoLabel.text = String((try? juiceMaker.getQuantity(of: .mango)) ?? 0)
    }
    
    func updateStepperValue() {
        strawberryStepper.value = Double((try? juiceMaker.getQuantity(of: .strawberry)) ?? 0)
        bananaStepper.value = Double((try? juiceMaker.getQuantity(of: .banana)) ?? 0)
        pineappleStepper.value = Double((try? juiceMaker.getQuantity(of: .pineapple)) ?? 0)
        kiwiStepper.value = Double((try? juiceMaker.getQuantity(of: .kiwi)) ?? 0)
        mangoStepper.value = Double((try? juiceMaker.getQuantity(of: .mango)) ?? 0)
    }
}
