//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryCurrentStock: UILabel!
    @IBOutlet weak var bananaCurrentStock: UILabel!
    @IBOutlet weak var pineappleCurrentStock: UILabel!
    @IBOutlet weak var kiwiCurrentStock: UILabel!
    @IBOutlet weak var mangoCurrentStock: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    private var currentFruitStock:(strawberry: UInt, banana: UInt, pineapple: UInt, kiwi: UInt, mango: UInt) = (strawberry: 0, banana: 0, pineapple: 0, kiwi: 0, mango: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        refreshLabels()
    }
    
    
    @IBAction func changeStockButtonTapped(_ sender: Any) {
        moveToChangeStockView()
    }
    
    @IBAction func JuiceOrderButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle {
        case .none:
            break
        case "딸바쥬스 주문":
            order(fruitJuice: .strawberryBanana)
        case "딸기쥬스 주문":
            order(fruitJuice: .strawberry)
        case "바나나쥬스 주문":
            order(fruitJuice: .banana)
        case "파인애플쥬스 주문":
            order(fruitJuice: .pineapple)
        case "망키쥬스 주문":
            order(fruitJuice: .mangoKiwi)
        case "키위쥬스 주문":
            order(fruitJuice: .kiwi)
        case "망고쥬스 주문":
            order(fruitJuice: .mango)
        default:
            break
        }
    }
    
    func checkCurrentStock() {
        guard let currentStrawberry = juiceMaker.fruitStore.quantity(of: .strawberry) else {
            registerFailAlert()
            print("\(Fruit.strawberry)의 재고에 문제가 생겼습니다.")
            return }
        currentFruitStock.strawberry = currentStrawberry
        
        guard let currentBanana = juiceMaker.fruitStore.quantity(of: .banana) else {
            registerFailAlert()
            print("\(Fruit.banana)의 재고에 문제가 생겼습니다.")
            return }
        currentFruitStock.banana = currentBanana
        
        guard let currentPineapple = juiceMaker.fruitStore.quantity(of: .pineapple) else {
            registerFailAlert()
            print("\(Fruit.pineapple)의 재고에 문제가 생겼습니다.")
            return }
        currentFruitStock.pineapple = currentPineapple
        
        guard let currentKiwi = juiceMaker.fruitStore.quantity(of: .kiwi) else {
            registerFailAlert()
            print("\(Fruit.kiwi)의 재고에 문제가 생겼습니다.")
            return }
        currentFruitStock.kiwi = currentKiwi
        
        guard let currentMango = juiceMaker.fruitStore.quantity(of: .mango) else {
            registerFailAlert()
            print("\(Fruit.mango)의 재고에 문제가 생겼습니다.")
            return }
        currentFruitStock.mango = currentMango
    }
    
    func changeFruitLabels() {
        strawberryCurrentStock.text = String(currentFruitStock.strawberry)
        bananaCurrentStock.text = String(currentFruitStock.banana)
        pineappleCurrentStock.text = String(currentFruitStock.pineapple)
        kiwiCurrentStock.text = String(currentFruitStock.kiwi)
        mangoCurrentStock.text = String(currentFruitStock.mango)
    }
    
    func refreshLabels() {
        checkCurrentStock()
        changeFruitLabels()
    }
    
    func order(fruitJuice: FruitJuice) {
        do {
            try juiceMaker.make(juiceName: fruitJuice)
        } catch {
            showOrderFailAlert()
        }
        showOrderSucessAlert(fruitJuice: fruitJuice)
        
        refreshLabels()
    }
    
    func showOrderSucessAlert(fruitJuice: FruitJuice) {
        let successAlert = UIAlertController(title: StringConstatns.successAlertTitle,
                                             message: fruitJuice.rawValue + StringConstatns.successAlertMessage,
                                             preferredStyle: UIAlertController.Style.alert)
        self.present(successAlert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            successAlert.dismiss(animated: true)
        }
    }
    
    func showOrderFailAlert() {
        let failAlert = UIAlertController(title: StringConstatns.failAlertTitle,
                                          message: StringConstatns.failAlertMessage,
                                          preferredStyle: UIAlertController.Style.alert)
        
        failAlert.addAction(UIAlertAction(title: StringConstatns.yes,
                                          style: UIAlertAction.Style.default,
                                          handler: { _ in
            self.moveToChangeStockView()
        }))
        
        failAlert.addAction(UIAlertAction(title: StringConstatns.no,
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in }))
        
        self.present(failAlert, animated: true, completion: nil)
    }
    
    func registerFailAlert() {
        let registerFailAlert = UIAlertController(title: StringConstatns.registerFailAlertTitle,
                                                  message: StringConstatns.registerFailAlertMessage,
                                                  preferredStyle: UIAlertController.Style.alert)
        
        self.present(registerFailAlert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            registerFailAlert.dismiss(animated: true)
        }
    }
    
    func moveToChangeStockView() {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ChangeStockViewController.self)) as? ChangeStockViewController {
            nextVC.vcon = self
            self.present(nextVC, animated: true)
        }
    }
}
