//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Jin-Mac on 12/12/23.
//

import UIKit

protocol FruitStockDelegate: AnyObject {
    func didUpdateFruitStock(fruitStock: [Fruits: Int])
}

class FruitStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet var steppers: [UIStepper]!
    
    weak var delegate: FruitStockDelegate?
    var fruitStock: [Fruits: Int] = [:]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()

        // Do any additional setup after loading the view.
    }
    
    private func updateFruitLabels() {
        if let strawberryStock = fruitStock[.strawberry],
           let bananaStock = fruitStock[.banana],
           let pineappleStock = fruitStock[.pineapple],
           let kiwiStock = fruitStock[.kiwi],
           let mangoStock = fruitStock[.mango] {
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
            pineappleStockLabel.text = String(pineappleStock)
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
        }
    }
    
    @IBAction func closedStockViewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
