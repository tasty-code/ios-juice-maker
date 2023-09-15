//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/14.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remainFruit()
    }
    
    private func remainFruit() {
        do {
            guard let juiceMaker = juiceMaker else { return }
            
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
