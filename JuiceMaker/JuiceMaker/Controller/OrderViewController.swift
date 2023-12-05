//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }

    @IBAction func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func configUI() {
        strawberryQuantityLabel.text = String(fruitStore.strawberry)
        bananaQuantityLabel.text = String(fruitStore.banana)
        pineappleQuantityLabel.text = String(fruitStore.pineapple)
        kiwiQuantityLabel.text = String(fruitStore.kiwi)
        mangoQuantityLabel.text = String(fruitStore.mango)
    }
}

