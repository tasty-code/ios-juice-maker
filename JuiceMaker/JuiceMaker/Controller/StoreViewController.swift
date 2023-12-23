//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class StoreViewController: UIViewController {
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
    
    let fruitStore = FruitStore.shared
    lazy var juiceMaker: JuiceMaker = JuiceMaker(store: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.initializeFruit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    
    @IBAction func moveToFruitStoreBtnTapped(_ sender: Any) {
        moveFruitStore()
    }
    
    @IBAction func juiceMakeBtnTapped(_ choice: UIButton) {
        var selectedRecipe : Recipe?
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
            break
        }
        guard let selectedRecipe else { return }
        let result = juiceMaker.judgeOrder(selectedRecipe)
        let recipeName = selectedRecipe.recipeName
        setMarketView(checkSuccess(result), recipeName)
    }
    
    private func moveFruitStore() {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: VCIdentifiers.StockViewController.rawValue) as? StockViewController else { return }
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
    }
    
}

extension StoreViewController {
    private func checkSuccess(_ result: Result<Bool, JuiceMakerErrors>) -> Bool {
        switch result {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
    
    private func setMarketView(_ isDone: Bool, _ recipeName: String) {
        showAlert(isDone, recipeName)
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
    
    private func showAlert(_ isDone: Bool, _ recipeName: String) {
        if isDone {
            AlertManager.setAlert(
                vcToShow: self,
                preferredStyle: UIAlertController.Style.alert,
                title: "\(recipeName) 쥬스 나왔습니다! 맛있게 드세요!",
                message: "",
                handler: ["확인": nil]
            )
        }
        else {
            AlertManager.setAlert(
                vcToShow: self,
                preferredStyle: UIAlertController.Style.alert,
                title: "재료가 모자라요. 재고를 수정할까요?",
                message: "",
                handler: ["예": self.moveFruitStore, "아니오": nil]
            )
        }
    }
}
