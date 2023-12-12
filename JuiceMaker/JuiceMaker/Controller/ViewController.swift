//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fruitStore: FruitStore = FruitStore()
    lazy var juiceMaker: JuiceMaker = JuiceMaker(store: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.initializeFruit()
    }
     
    @IBAction func juiceMakeBtnTapped(_ choice: UIButton) {
        var selectedRecipe : Recipe
        switch choice.tag {
        case 0:
            selectedRecipe = Recipe.strawberryBanana
        case 1:
            selectedRecipe = Recipe.mangoKiwi
        case 2:
            selectedRecipe = Recipe.strawberry
        case 3:
            selectedRecipe = Recipe.banana
        case 4:
            selectedRecipe = Recipe.pineapple
        case 5:
            selectedRecipe = Recipe.kiwi
        case 6:
            selectedRecipe = Recipe.mango
        default:
            selectedRecipe = Recipe.mango
        }
        let result = juiceMaker.order(selectedRecipe)
        setMarketView(result)
    }
    
    private func setMarketView(_ isDone: Bool) {
        self.fruitStore.fruitsflag.forEach { fruit, isUsed in
            if isUsed {
                
            }
        }
    }
}

