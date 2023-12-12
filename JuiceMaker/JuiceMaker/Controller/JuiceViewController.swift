//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCount: UILabel!
    @IBOutlet private weak var bananaCount: UILabel!
    @IBOutlet private weak var pineappleCount: UILabel!
    @IBOutlet private weak var kiwiCount: UILabel!
    @IBOutlet private weak var mangoCount: UILabel!
    
    private var juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFruitsCount()
    }
    
    private func showFruitsCount() {
        strawberryCount.text = fruitStore.storage[FruitStore.Fruit.strawberry]?.description
        bananaCount.text = fruitStore.storage[FruitStore.Fruit.banana]?.description
        pineappleCount.text = fruitStore.storage[FruitStore.Fruit.pineapple]?.description
        kiwiCount.text = fruitStore.storage[FruitStore.Fruit.kiwi]?.description
        mangoCount.text = fruitStore.storage[FruitStore.Fruit.mango]?.description
    }

    @IBAction private func adjustStock(_ sender: Any) {
        let supplyVC = storyboard?.instantiateViewController(withIdentifier: "SupplyViewController") as! SupplyViewController
                                
        navigationController?.pushViewController(supplyVC, animated: true)
    }
    
    @IBAction private func orderStrawberryJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.딸기쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderBananaJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.바나나쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderPineappleJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.파인애플쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderKiwiJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.키위쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderMangoJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.망고쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderStrawberryBananaJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.딸바쥬스)
        showFruitsCount()
    }
    
    @IBAction private func orderMangoKiwiJuice(_ sender: Any) {
        juiceMaker.makeJuice(menu: JuiceMaker.Menu.망고키위쥬스)
        showFruitsCount()
    }
    
}

