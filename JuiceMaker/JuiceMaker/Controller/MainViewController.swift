//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remainFruit()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveInventory" {
            guard let vc = segue.destination as? FruitInventoryViewController else { return }
            vc.juiceMaker = self.juiceMaker
        }
    }
    
    private func remainFruit() {
        do {
            let strawberry = try juiceMaker.remainingCount(fruit: .strawberry)
            strawberryLabel.text = String(strawberry)
            
            let banana = try juiceMaker.remainingCount(fruit: .banana)
            bananaLabel.text = String(banana)
            
            let kiwi = try juiceMaker.remainingCount(fruit: .kiwi)
            kiwiLabel.text = String(kiwi)
            
            let pineapple = try juiceMaker.remainingCount(fruit: .pineapple)
            pineappleLabel.text = String(pineapple)
            
            let mango = try juiceMaker.remainingCount(fruit: .mango)
            mangoLabel.text = String(mango)
        } catch {
            print(error)
        }
    }
}

