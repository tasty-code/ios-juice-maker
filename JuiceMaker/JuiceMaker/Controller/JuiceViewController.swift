//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    //MARK: - Storyboard UI Outlet, Action
    @IBOutlet private var juiceEmojiBundle: [UILabel]!
    @IBOutlet private var juiceStoreCountBundle: [UILabel]!
    @IBOutlet private var mixJuiceOrderBundle: [UIButton]!
    @IBOutlet private var singleJuiceOrderBundle: [UIButton]!
    
    @IBAction private func mixJuiceOrder(_ sender: UIButton) {
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
    @IBAction private func singleJuiceOrder(_ sender: UIButton) {
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
    
    //MARK: - JuiceViewController Property
    private let juiceMaker = JuiceMaker()
    var sendCount: [String] = []
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    //MARK: - initialization Stock Display
    private func currentStockDisplay(on emojiLabels: [UILabel], change countLabels: [UILabel]) {
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
    
    private func convertToStringStock(fruit count: Fruit) -> String {
        let fruitStock = juiceMaker.fruitStore.sendBackToAvailableStock(fruit: count)
        return String(fruitStock)
    }
    
    //MARK: - Juice Make Order
    private func order(juiceType: SingleFruitJuice) {
        let needCount = juiceMaker.fruitStore.needCountOfMake(to: juiceType)
        let isContinue = juiceMaker.isMakeable(juiceType, send: needCount)
        
        guard isContinue else {
            failiureAlert()
            return
        }
        juiceMaker.make(single: juiceType)
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    private func order(juiceType: MixFruitJuice) {
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

//MARK: - Alert
extension JuiceViewController {
    private func successAlert(juiceType: String) {
        let success = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: nil, message: "\(juiceType)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        alert.addAction(success)
        present(alert, animated: true, completion: nil)
    }
    
    private func failiureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "예", style: .default, handler: { action in
            self.presentModally()
        })
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        alert.addAction(successAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func presentModally() {
        guard let fruitNavigationController = self.storyboard?.instantiateViewController(identifier: "FruitNavi") as? UINavigationController else { return }
        fruitNavigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(fruitNavigationController, animated: true, completion: nil)
    }
}

