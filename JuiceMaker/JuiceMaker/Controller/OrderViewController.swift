//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }

    @IBAction func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @IBAction func tapMakeJuiceButton(_ sender: UIButton) {
        guard let selectedButton = sender.currentTitle,
              let juice = Juice(rawValue: selectedButton) else {
            return
        }
        
        do {
            try juiceMaker.makeJuice(juiceType: juice)
            configUI()
        } catch {
            print("재고가 부족합니다.")
        }
    }
    
    func configUI() {
        strawberryQuantityLabel.text = String(fruitStore.strawberry)
        bananaQuantityLabel.text = String(fruitStore.banana)
        pineappleQuantityLabel.text = String(fruitStore.pineapple)
        kiwiQuantityLabel.text = String(fruitStore.kiwi)
        mangoQuantityLabel.text = String(fruitStore.mango)
    }
}

