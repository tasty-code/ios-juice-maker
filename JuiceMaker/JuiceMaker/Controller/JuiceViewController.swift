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
        switch MixFruitJuice(rawValue: juiceType) {
        case .strawberryBanana:
            order(juiceType: .strawberryBanana)
            successAlert(juiceType: "🍓🍌")
        case .mangoKiwi:
            order(juiceType: .mangoKiwi)
            successAlert(juiceType: "🥭🥝")
        default:
            break
        }
    }
    
    @IBAction func singleJuiceOrder(_ sender: UIButton) {
        guard let juiceType = sender.currentTitle else {
            return
        }
        switch SingleFruitJuice(rawValue: juiceType) {
        case .strawberry:
            order(juiceType: .strawberry)
            successAlert(juiceType: "🍓")
        case .banana:
            order(juiceType: .banana)
            successAlert(juiceType: "🍌")
        case .pineApple:
            order(juiceType: .pineApple)
            successAlert(juiceType: "🍍")
        case .kiwi:
            order(juiceType: .kiwi)
            successAlert(juiceType: "🥝")
        case .mango:
            order(juiceType: .mango)
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
    
    func currentStockDisplay(on emojiLabels: [UILabel], change countLabels: [UILabel]) {
        for (emojiLabel, countLabel) in zip(emojiLabels, countLabels) {
            guard let checkTest = emojiLabel.text else {
                return
            }
            
            switch checkTest {
            case "🍓":
                countLabel.text = convertToStringStock(fruit: .strawberry)
            case "🍌":
                countLabel.text = convertToStringStock(fruit: .banana)
            case "🍍":
                countLabel.text = convertToStringStock(fruit: .pineApple)
            case "🥝":
                countLabel.text = convertToStringStock(fruit: .kiwi)
            case "🥭":
                countLabel.text = convertToStringStock(fruit: .mango)
            default:
                return
            }
        }
    }
    
    func convertToStringStock(fruit count: Fruit) -> String {
        let fruitStock = juiceMaker.fruitStore.sendBackToAvailableStock(fruit: count)
        return String(fruitStock)
    }
    
    func order(juiceType: SingleFruitJuice) {
        let needCount = juiceMaker.fruitStore.needCountOfMake(to: juiceType)
        let isContinue = juiceMaker.isMakeable(juiceType, send: needCount)
        
        guard isContinue else {
            failiureAlert()
            return
        }
        juiceMaker.make(single: juiceType)
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    func order(juiceType: MixFruitJuice) {
        let needCounts = juiceMaker.fruitStore.needCountOfMake(to: juiceType)
        let isContinue = juiceMaker.isMakeable(juiceType, send: needCounts)
        
        guard isContinue else {
            failiureAlert()
            return
        }
        juiceMaker.make(mix: juiceType)
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
}

extension JuiceViewController {
    func successAlert(juiceType: String) {
        let success = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: nil, message: "\(juiceType)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        alert.addAction(success)
        present(alert, animated: true, completion: nil)
    }
    
    func failiureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "예", style: .default, handler: { action in
            if let BViewController = self.storyboard?.instantiateViewController(identifier: "FruitView") as? FruitViewController {
                self.present(BViewController, animated: true, completion: nil)
            }
        })
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        alert.addAction(successAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
}

