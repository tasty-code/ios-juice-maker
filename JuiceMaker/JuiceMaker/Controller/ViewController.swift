//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var fruitStore: FruitStore
//    lazy var juiceMaker: JuiceMaker
//    
//    required init(coder: NSCoder) {
//        fruitStore = FruitStore()
//        juiceMaker = JuiceMaker(store: fruitStore)
//        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var prompt = Prompt()
        prompt.sendMessage(input: prompt.initMessage)
        var fruitStore = FruitStore()
        var juiceMaker = JuiceMaker(store: fruitStore)
        
        try! juiceMaker.makeJuice(kind: Recipe.strawberryBanana)
        print(fruitStore.fruits)
        fruitStore.supplyFruits(fruitName: "strawberry", quantity: 100)
        print(fruitStore.fruits)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnStrawberryBanana(_ sender: Any) {
        
    }
    
    @IBAction func btnMangoKiwi(_ sender: Any) {
    }
    
    
    @IBAction func btnStrawberry(_ sender: Any) {
    }
    
    @IBAction func btnBanana(_ sender: Any) {
    }
    
    
    @IBAction func btnPineapple(_ sender: Any) {
    }
    
    
    @IBAction func btnKiwi(_ sender: Any) {
    }
    
    
    @IBAction func btnMango(_ sender: Any) {
    }
    
    
}

