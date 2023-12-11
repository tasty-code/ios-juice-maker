//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore()

    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineApple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let starwberryQuantity = fruitStore.fruitInventory["딸기"] {
            strawberry.text = "\(starwberryQuantity)"
        } else {
            print(fruitStoreError.errorDefault)
        }
        
        if let bananaQuantity = fruitStore.fruitInventory["바나나"] {
            banana.text = "\(bananaQuantity)"
        } else {
            print(fruitStoreError.errorDefault)
        }
        
        if let pineAppleQuantity = fruitStore.fruitInventory["파인애플"]  {
            pineApple.text = "\(pineAppleQuantity)"
        } else {
            print(fruitStoreError.errorDefault)
        }
        
        if let kiwiQuantity = fruitStore.fruitInventory["키위"] {
            kiwi.text = "\(kiwiQuantity)"
        }
        
        if let mangoQuantity = fruitStore.fruitInventory["망고"] {
            mango.text = "\(mangoQuantity)"
        }
        
        
        
    }
    
    @IBAction func inventoyChange(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "quantityVC", sender: self)
    }
    
    
    
    

}

