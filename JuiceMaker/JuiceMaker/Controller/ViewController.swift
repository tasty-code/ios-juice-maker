//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private lazy var fruitsLabel: [String: UILabel] = [
        Fruit.strawberry.rawValue : strawberryLabel,
        Fruit.banana.rawValue : bananaLabel,
        Fruit.pineapple.rawValue : pineappleLabel,
        Fruit.kiwi.rawValue : kiwiLabel,
        Fruit.mango.rawValue : mangoLabel
    ]
    
    var fruitStore: FruitStore = FruitStore()
    lazy var juiceMaker: JuiceMaker = JuiceMaker(store: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.initializeFruit()
        initView()
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
        self.fruitStore.fruitsFlag.forEach { fruit, isUsed in
            guard let uiLabel = fruitsLabel[fruit],
                  let fruitValue = self.fruitStore.fruits[fruit],
                  isDone
            else {
                return
            }
            uiLabel.text = String(fruitValue)
            self.fruitStore.resetFlag()
        }
    }
    private func initView() {
        self.fruitStore.fruitsFlag.forEach { fruit, isUsed in
            guard let uiLabel = fruitsLabel[fruit],
                  let fruitValue = self.fruitStore.fruits[fruit]
            else {
                return
            }
            uiLabel.text = String(fruitValue)
        }
    }
}
