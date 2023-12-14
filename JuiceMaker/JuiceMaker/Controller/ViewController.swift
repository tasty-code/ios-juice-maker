//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © 유니 & 이안. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitLabel()
    }
    
    func setFruitLabel() {
        strawberryLabel.text = changeIntToStirng(fruit: .strawberry)
        bananaLabel.text =  changeIntToStirng(fruit: .banana)
        pineappleLabel.text = changeIntToStirng(fruit: .pineapple)
        kiwiLabel.text =  changeIntToStirng(fruit: .kiwi)
        mangoLabel.text =  changeIntToStirng(fruit: .mango)
        
    }
    func changeIntToStirng(fruit: Fruit) -> String {
        return String(FruitStore.shared.inventory(fruit: fruit))
    }
    


}

