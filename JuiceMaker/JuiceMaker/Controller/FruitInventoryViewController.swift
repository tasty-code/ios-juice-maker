//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by 유니 & 이안. on 12/14/23.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    
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
    
    let juiceMaker: JuiceMaker
    
    init?(juiceMaker: JuiceMaker, coder: NSCoder) {
        self.juiceMaker = juiceMaker
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveFruitLabel()
        receiveFruitStepper()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func receiveFruitLabel() {
         strawberryLabel.text = "\(juiceMaker.fruitStore.inventory(fruit: .strawberry))"
         bananaLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .banana))"
         pineappleLabel.text = "\(juiceMaker.fruitStore.inventory(fruit: .pineapple))"
         kiwiLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .kiwi))"
         mangoLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .mango))"
     }
    
    private func receiveFruitStepper() {
        strawberryStepper.value = Double( juiceMaker.fruitStore.inventory(fruit: .strawberry))
        bananaStepper.value =  Double(juiceMaker.fruitStore.inventory(fruit: .banana))
        pineappleStepper.value = Double(juiceMaker.fruitStore.inventory(fruit: .pineapple))
        kiwiStepper.value =  Double(juiceMaker.fruitStore.inventory(fruit: .kiwi))
        mangoStepper.value =  Double(juiceMaker.fruitStore.inventory(fruit: .mango))
    }
    
    @IBAction func changeValueStrawberryStepper(_ sender: UIStepper) {
        strawberryLabel.text = Int(sender.value).description
        juiceMaker.fruitStore.changeAmout(fruit: .strawberry, amout: Int(sender.value))
    }
    
    @IBAction func changeValueBananaStepper(_ sender: UIStepper) {
        bananaLabel.text = Int(sender.value).description
        juiceMaker.fruitStore.changeAmout(fruit: .banana, amout: Int(sender.value))
    }
    
    @IBAction func changeValuePineappleStepper(_ sender: UIStepper) {
        pineappleLabel.text = Int(sender.value).description
        juiceMaker.fruitStore.changeAmout(fruit: .pineapple, amout: Int(sender.value))
    }
    
    @IBAction func changeValueKiwiStepper(_ sender: UIStepper) {
        kiwiLabel.text = Int(sender.value).description
        juiceMaker.fruitStore.changeAmout(fruit: .kiwi, amout: Int(sender.value))
    }
    
    @IBAction func changeValueMangoStepper(_ sender: UIStepper) {
        mangoLabel.text = Int(sender.value).description
        juiceMaker.fruitStore.changeAmout(fruit: .mango, amout: Int(sender.value))
    }
}

