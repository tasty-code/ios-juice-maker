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
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
    }
}

