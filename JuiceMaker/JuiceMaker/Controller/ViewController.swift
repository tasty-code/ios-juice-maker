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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        refreshCurrentStockLabel()
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
    
    func refreshCurrentStockLabel() {
        do {
            strawberryCurrentStock.text = String(try juiceMaker.fruitStore.quantity(of: .strawberry))
            bananaCurrentStock.text = String(try juiceMaker.fruitStore.quantity(of: .banana))
            pineappleCurrentStock.text = String(try juiceMaker.fruitStore.quantity(of: .pineapple))
            kiwiCurrentStock.text = String(try juiceMaker.fruitStore.quantity(of: .kiwi))
            mangoCurrentStock.text = String(try juiceMaker.fruitStore.quantity(of: .mango))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func order(fruitJuice: FruitJuice) {
        do {
            try juiceMaker.make(juiceName: fruitJuice)
        } catch {
            showOrderFailAlert()
        }
        showOrderSucessAlert(fruitJuice: fruitJuice)
        
        refreshCurrentStockLabel()
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
    
    func moveToChangeStockView() {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: StringConstatns.changeStockViewController) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
