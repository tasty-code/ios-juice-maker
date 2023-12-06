//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fruitStore = FruitStore()
    lazy var juiceMaker = JuiceMaker(store: self.fruitStore)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.supplyFruits(fruitName: "strawberry", quantity: 100)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnStrawberryBanana(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.strawberryBanana)
    }
    
    @IBAction func btnMangoKiwi(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.mangoKiwi)
    }
    
    @IBAction func btnStrawberry(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.strawberry)
    }
    
    @IBAction func btnBanana(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.banana)
    }
    
    @IBAction func btnPineapple(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.pineapple)
    }
    
    @IBAction func btnKiwi(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.kiwi)
    }
    
    @IBAction func btnMango(_ sender: Any) {
        juiceMaker.makeJuice(Recipe.mango)
    }
    @IBAction func btnMoveToFruitStore(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "View Controller") else {return}
                self.navigationController?.pushViewController(viewController, animated: true)
    }
}

