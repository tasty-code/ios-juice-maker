//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    
    @IBOutlet var juiceEmojiBundle: [UILabel]!
    @IBOutlet var juiceStoreCountBundle: [UILabel]!
    @IBOutlet var mixJuiceOrderBundle: [UIButton]!
    @IBOutlet var singleJuiceOrderBundle: [UIButton]!
    
    @IBAction func mixJuiceOrder(_ sender: UIButton) {
        guard let juiceType = sender.currentTitle else {
            return
        }
        switch juiceType {
        case "딸바쥬스 주문":
            makeAndUpdate(juiceType: .strawberryBanana)
        case "망키쥬스 주문":
            makeAndUpdate(juiceType: .mangoKiwi)
        default:
            break
        }
    }
    
    @IBAction func singleJuiceOrder(_ sender: UIButton) {
        guard let juiceType = sender.currentTitle else {
            return
        }
        switch juiceType {
        case "딸기쥬스 주문":
            let choiceAlert = makeAndUpdate(juiceType: .strawberry)
            guard choiceAlert else {
                return failiureAlert()
            }
            successAlert(juiceType: "🍓")
        case "바나나쥬스 주문":
            let choiceAlert = makeAndUpdate(juiceType: .banana)
            guard choiceAlert else {
                return failiureAlert()
            }
            successAlert(juiceType: "🍌")
        case "파인애플쥬스 주문":
            makeAndUpdate(juiceType: .pineApple)
            successAlert(juiceType: "🍍")
        case "키위쥬스 주문":
            makeAndUpdate(juiceType: .kiwi)
            successAlert(juiceType: "🥝")
        case "망고쥬스 주문":
            makeAndUpdate(juiceType: .mango)
            successAlert(juiceType: "🥭")
        default:
            break
        }
    }
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    func currentStockDisplay(on emojiLabels: [UILabel], change countLabels: [UILabel]) -> Bool {
        for (emojiLabel, countLabel) in zip(emojiLabels, countLabels) {
            guard let checkTest = emojiLabel.text else {
                return false
            }
            
            switch checkTest {
            case "🍓":
                countLabel.text = currentStock(fruitName: .strawberry)
            case "🍌":
                countLabel.text = currentStock(fruitName: .banana)
            case "🍍":
                countLabel.text = currentStock(fruitName: .pineApple)
            case "🥝":
                countLabel.text = currentStock(fruitName: .kiwi)
            case "🥭":
                countLabel.text = currentStock(fruitName: .mango)
            default:
                return false
            }
        }
//        if countLabel.text == "0" { return false }
        return true
    }
    
    func currentStock(fruitName: Fruit) -> String {
        guard let fruitStock = juiceMaker.fruitStore.store[fruitName] else {
            return ""
        }
        return String(fruitStock)
    }
    
    func makeAndUpdate(juiceType: SingleFruitJuice) -> Bool {
        juiceMaker.make(single: juiceType)
        let choiceAlert = currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
        return choiceAlert
    }
    
    func makeAndUpdate(juiceType: MixFruitJuice) {
        juiceMaker.make(mix: juiceType)
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    func successAlert(juiceType: String) {
        let success = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: nil, message: "\(juiceType)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        alert.addAction(success)
        present(alert, animated: true, completion: nil)
    }
    
    func failiureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "예", style: .default,
                                          handler: { action in
            self.navigationController?.pushViewController(FruitViewController(), animated: true)
        })
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        alert.addAction(successAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
}

