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
            makeJuice(fruitJuice: .strawberryBanana)
        case "딸기쥬스 주문":
            makeJuice(fruitJuice: .strawberry)
        case "바나나쥬스 주문":
            makeJuice(fruitJuice: .banana)
        case "파인애플쥬스 주문":
            makeJuice(fruitJuice: .pineapple)
        case "망키쥬스 주문":
            makeJuice(fruitJuice: .mangoKiwi)
        case "키위쥬스 주문":
            makeJuice(fruitJuice: .kiwi)
        case "망고쥬스 주문":
            makeJuice(fruitJuice: .mango)
        default:
            break
        }
    }
    
    func refreshCurrentStockLabel() {
        do {
            strawberryCurrentStock.text = String(try juiceMaker.fruitStore.numberOf(fruit: .strawberry))
            bananaCurrentStock.text = String(try juiceMaker.fruitStore.numberOf(fruit: .banana))
            pineappleCurrentStock.text = String(try juiceMaker.fruitStore.numberOf(fruit: .pineapple))
            kiwiCurrentStock.text = String(try juiceMaker.fruitStore.numberOf(fruit: .kiwi))
            mangoCurrentStock.text = String(try juiceMaker.fruitStore.numberOf(fruit: .mango))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func makeJuice(fruitJuice: FruitJuice) {
        do {
            try juiceMaker.make(juiceName: fruitJuice)
        } catch {
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
        
        let successAlert = UIAlertController(title: StringConstatns.successAlertTitle,
                                             message: fruitJuice.rawValue + StringConstatns.successAlertMessage,
                                             preferredStyle: UIAlertController.Style.alert)
        
        self.present(successAlert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            successAlert.dismiss(animated: true)
        }
        
        refreshCurrentStockLabel()
    }
    
    func moveToChangeStockView() {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: StringConstatns.changeStockViewController) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
