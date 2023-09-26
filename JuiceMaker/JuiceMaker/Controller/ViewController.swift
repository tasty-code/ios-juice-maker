//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet var strawBerryLabel: UILabel!
    @IBOutlet var bananaLabel: UILabel!
    @IBOutlet var pineappleLabel: UILabel!
    @IBOutlet var kiwiLabel: UILabel!
    @IBOutlet var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingLabel()
    }
}

extension ViewController {
    private func bindingLabel() {
        do {
            strawBerryLabel.text = try juiceMaker.getRemainingFruits(.strawberry)
            bananaLabel.text = try juiceMaker.getRemainingFruits(.banana)
            pineappleLabel.text = try juiceMaker.getRemainingFruits(.pineapple)
            kiwiLabel.text = try juiceMaker.getRemainingFruits(.kiwi)
            mangoLabel.text = try juiceMaker.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
    
    private func statusAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "취소", style: .default)
        let changeAction = UIAlertAction(title: "이동", style: .default, handler: { action in
            self.moveToStockVc()
        })
        
        alert.addAction(cancleAction)
        alert.addAction(changeAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToStockVc() {
        guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as? StockViewController else {
            return
        }
        stockVC.injectModel(self.juiceMaker)

        self.navigationController?.pushViewController(stockVC, animated: true)
    }
}

extension ViewController {
    @IBAction private func showPush() {
        moveToStockVc()
    }
    
    @IBAction private func makeOrder(_ sender: UIButton) {
        guard let menu = Juice(rawValue: sender.tag) else {
            return
        }
        let orderResult = juiceMaker.makingJuice(menu)
        
        if orderResult.success {
            bindingLabel()
            statusAlert(orderResult.message)
            return
        }
        failAlert(orderResult.message)
    }
}

extension ViewController: SendStockDelegate {
    func sendStock(data: JuiceMaker) {
        do {
            strawBerryLabel.text = try data.getRemainingFruits(.strawberry)
            bananaLabel.text = try data.getRemainingFruits(.banana)
            pineappleLabel.text = try data.getRemainingFruits(.pineapple)
            kiwiLabel.text = try data.getRemainingFruits(.kiwi)
            mangoLabel.text = try data.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
}
