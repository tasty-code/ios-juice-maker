//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let juiceMaker: JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruitList: [
        FruitStore.Fruit(name: "딸기"),
        FruitStore.Fruit(name: "바나나"),
        FruitStore.Fruit(name: "파인애플"),
        FruitStore.Fruit(name: "키위"),
        FruitStore.Fruit(name: "망고")
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBOutlet weak var strawberryQantityLabel: UILabel!
    
    @IBOutlet weak var bananaQantityLabel: UILabel!
    
    @IBOutlet weak var pineappleQantityLabel: UILabel!
    
    @IBOutlet weak var kiwiQantityLabel: UILabel!
    
    @IBOutlet weak var mangoQuatityLabel: UILabel!
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else {return}
        juiceMaker.startOrder(juiceName: juiceName)
        updateUI()
    }
    
    
    private func updateUI() {
        strawberryQantityLabel.text = String(juiceMaker.fruitStore.fruitList[0].stock)
        bananaQantityLabel.text = String(juiceMaker.fruitStore.fruitList[1].stock)
        pineappleQantityLabel.text = String(juiceMaker.fruitStore.fruitList[2].stock)
        kiwiQantityLabel.text = String(juiceMaker.fruitStore.fruitList[3].stock)
        mangoQuatityLabel.text = String(juiceMaker.fruitStore.fruitList[4].stock)
    }
}

